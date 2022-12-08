import 'package:dartz/dartz.dart';
import 'package:flutter_practice_2/domain/entity/role_entity.dart';

abstract class AuthRepositories {
  String get table;
  Future<Either<String, RoleEnum>> signIn(String login, String password);
  Future<Either<String, bool>> signUp(
      String login,
      String password,
      String name,
      String surname,
      String middleName,
      String seriaPassport,
      String nomerPassport);
}
