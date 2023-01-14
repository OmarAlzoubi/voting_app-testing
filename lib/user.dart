import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';

import 'role.dart';

class KrapiUser {
  final String electionid;
  final String password;
  final String name;
  final String mobile;
  final Role role;
  final String? party;
  final String? profilePicUrl;

  KrapiUser(this.electionid, this.password, this.name, this.mobile, this.role,
      this.party, this.profilePicUrl);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'electionid': electionid});
    result.addAll({'password': password});
    result.addAll({'name': name});
    result.addAll({'mobile': mobile});
    result.addAll({'role': EnumToString.convertToString(role)});
    if (party != null) {
      result.addAll({'party': party});
    }
    if (profilePicUrl != null) {
      result.addAll({'profilepicurl': profilePicUrl});
    }

    return result;
  }

  factory KrapiUser.fromMap(Map<String, dynamic> map) {
    return KrapiUser(
      map['electionid'],
      map['password'],
      map['name'],
      map['mobile'],
      EnumToString.fromString(Role.values, map['role'])!,
      map['party'],
      map['profilepicurl'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KrapiUser &&
        other.electionid == electionid &&
        other.password == password &&
        other.name == name &&
        other.mobile == mobile &&
        other.role == role &&
        other.party == party;
  }

  @override
  int get hashCode {
    return electionid.hashCode ^
        password.hashCode ^
        name.hashCode ^
        mobile.hashCode ^
        role.hashCode ^
        party.hashCode;
  }
}
