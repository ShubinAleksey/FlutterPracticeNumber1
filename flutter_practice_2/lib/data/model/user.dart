import 'package:flutter_practice_2/domain/entity/role_entity.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class User extends UserEntity {
  late int id;
  final String login;
  final String password;
  final String name;
  final String surname;
  final String middleName;
  final int seriaPassport;
  late int nomerPassport;
  final RoleEnum idRole;

  User({
    required this.login,
    required this.password,
    required this.name,
    required this.surname,
    required this.middleName,
    required this.seriaPassport,
    required this.nomerPassport,
    required this.idRole,
  }) :super(login: login,
  password: password,
  name: name,
  surname: surname,
  middleName: middleName,
  seriaPassport: seriaPassport,
  nomerPassport: nomerPassport,
  idRole: idRole);

  Map<String,dynamic> toMap() {
    return {
      'login': login,
      'password': password,
      'name': name,
      'surname': surname,
      'middleName': middleName,
      'seriaPassport': seriaPassport,
      'nomerPassport': nomerPassport,
      'id_role': idRole.id,
    };
  }

  factory User.toFromMap(Map<String,dynamic> json) {
    return User(login: json['login'],
    password: json['password'],
    name: json['name'],
    surname: json['surname'],
    middleName: json['middleName'],
    seriaPassport: json['seriaPassport'],
    nomerPassport: json['nomerPassport'],
    idRole: json['id_role'],);
  } 
}