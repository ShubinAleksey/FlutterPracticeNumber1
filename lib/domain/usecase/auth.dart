import 'package:dartz/dartz.dart';
import 'package:flutter_practice_2/core/usecases/auth_use_case.dart';
import 'package:flutter_practice_2/domain/entity/role_entity.dart';
import 'package:flutter_practice_2/domain/repositories/auth_repositories.dart';

class Auth implements AuthUseCase<String, AuthParams> {
  final AuthRepositories authRepositories;

  Auth(this.authRepositories);

  @override
  Future<Either<String, RoleEnum>> signIn(AuthParams params) async {
    return await authRepositories.signIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> signUp(AuthParams params) async {
    return await authRepositories.signUp(
        params.login,
        params.password,
        params.name,
        params.surname,
        params.middleName,
        params.seriaPassport,
        params.nomerPassport);
  }
}

class AuthParams {
  final String login;
  final String password;
  final String name;
  final String surname;
  final String middleName;
  final String seriaPassport;
  final String nomerPassport;
  AuthParams(
      {required this.login,
      required this.password,
      required this.name,
      required this.surname,
      required this.middleName,
      required this.seriaPassport,
      required this.nomerPassport});
}
