import 'package:flutter_practice_2/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  Role({required super.role});

  Map<String, dynamic> toMap() {
    return {'role': role};
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}