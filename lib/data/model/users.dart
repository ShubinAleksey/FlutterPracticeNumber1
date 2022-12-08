import 'package:flutter_practice_2/domain/entity/role_entity.dart';
import 'package:flutter_practice_2/domain/entity/user_entity.dart';

class Users extends UsersEntity {
  // final String login;
  // final String password;
  // final String name;
  // final String surname;
  // final String middleName;
  // final String seriaPassport;
  // final String nomerPassport;
  // final RoleEnum idRole;

  // User({
  //   required this.login,
  //   required this.password,
  //   required this.name,
  //   required this.surname,
  //   required this.middleName,
  //   required this.seriaPassport,
  //   required this.nomerPassport,
  //   required this.idRole,
  // }) :super(login: login,
  // password: password,
  // name: name,
  // surname: surname,
  // middleName: middleName,
  // seriaPassport: seriaPassport,
  // nomerPassport: nomerPassport,
  // idRole: idRole);

  Users({
    super.id = 0,
    required super.login,
    required super.password,
    required super.name,
    required super.surname,
    required super.middleName,
    required super.seriaPassport,
    required super.nomerPassport,
    required super.idRole,
  });

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

  factory Users.toFromMap(Map<String,dynamic> json) {
    return Users(
      id: json['id'] as int,
      login: json['login'],
    password: json['password'],
    name: json['name'],
    surname: json['surname'],
    middleName: json['middleName'],
    seriaPassport: json['seriaPassport'],
    nomerPassport: json['nomerPassport'],
    idRole: RoleEnum.values.firstWhere((element) => element.id == (json['id_role'] as int)));
  } 
}