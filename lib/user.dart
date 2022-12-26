import 'package:enum_to_string/enum_to_string.dart';

import 'role.dart';

class KrapiUser {
  final String id;
  final String electionid;
  final String name;
  final String email;
  final String mobile;
  final Role role;
  final String? party;

  KrapiUser({
    required this.id,
    required this.name,
    required this.electionid,
    required this.email,
    required this.mobile,
    required this.role,
    this.party,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'electionid': electionid});
    result.addAll({'email': email});
    result.addAll({'mobile': mobile});
    result.addAll({'role': EnumToString.convertToString(role)});
    if (party != null) {
      result.addAll({'party': party});
    }

    return result;
  }

  factory KrapiUser.fromMap(Map<String, dynamic> map) {
    return KrapiUser(
      id: map['id'],
      name: map['name'],
      electionid: map['electionid'],
      email: map['email'],
      mobile: map['mobile'],
      role: EnumToString.fromString(Role.values, map['role'])!,
      party: map['party'] ?? '',
    );
  }
}
