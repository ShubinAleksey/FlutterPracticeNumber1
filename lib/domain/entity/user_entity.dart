import 'package:flutter_practice_2/domain/entity/role_entity.dart';

class UsersEntity{
  late int id;
  final String login;
  final String password;
  final String name;
  final String surname;
  final String middleName;
  final String seriaPassport;
  final String nomerPassport;
  final RoleEnum idRole;

  UsersEntity({
    this.id = 0,
    required this.login,
    required this.password,
    required this.name,
    required this.surname,
    required this.middleName,
    required this.seriaPassport,
    required this.nomerPassport,
    required this.idRole,
  });
}