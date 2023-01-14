import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voting_app/exceptions.dart';
import 'package:voting_app/user.dart';
import 'package:path/path.dart' as p;

class SupabaseAuthProvider {
  static final SupabaseAuthProvider _instance = SupabaseAuthProvider.internal();

  factory SupabaseAuthProvider() {
    return _instance;
  }
  SupabaseAuthProvider.internal();

  KrapiUser? _currentUser;

  KrapiUser get currentUser {
    final user = _currentUser;
    if (user != null) {
      return user;
    }

    throw UserNotLoggedInException();
  }

  Future<void> updateProfilePic(File profilePic) async {
    // Get all files path under current use directory.
    final filesList = await Supabase.instance.client.storage
        .from("profile-pictures")
        .list(path: currentUser.electionid);

    final filesName =
        filesList.map((e) => "${currentUser.electionid}/${e.name}");

    // Remove all files under current user directory
    if (filesName.toList().isNotEmpty) {
      await Supabase.instance.client.storage
          .from("profile-pictures")
          .remove(filesName.toList());
    }

    // Upload the new profile pic
    await Supabase.instance.client.storage.from('profile-pictures').upload(
        '${currentUser.electionid}/${currentUser.electionid}${p.extension(profilePic.path)}',
        profilePic,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: false,
          contentType: 'image/png',
        ),
        retryController: StorageRetryController());

    String imageUrl = Supabase.instance.client.storage
        .from('profile-pictures')
        .getPublicUrl(
            '${currentUser.electionid}/${currentUser.electionid}${p.extension(profilePic.path)}');

    // Update the user table
    await Supabase.instance.client
        .from("users")
        .update({"profilepicurl": imageUrl}).match(
            {"electionid": currentUser.electionid});

    // Update localUser.
    await refreshCurrentUser();
  }

  Future<void> refreshCurrentUser() async {
    final userRow = await Supabase.instance.client
        .from('users')
        .select<Map<String, dynamic>?>('*')
        .match({"electionid": currentUser.electionid}).maybeSingle();

    if (userRow == null) {
      throw ElectionidIsNotRegisteredException();
    }

    _currentUser = KrapiUser.fromMap(userRow);
  }

  Future<void> signIn(
      {required String electionid, required String password}) async {
    final userRow = await Supabase.instance.client
        .from('users')
        .select<Map<String, dynamic>?>('*')
        .match({"electionid": electionid}).maybeSingle();

    if (userRow == null) {
      throw ElectionidIsNotRegisteredException();
    }

    if (userRow['password'] != password) {
      throw WrongPasswordException();
    }

    _currentUser = KrapiUser.fromMap(userRow);
  }

  void signOut() async {
    _currentUser = null;
  }
}
