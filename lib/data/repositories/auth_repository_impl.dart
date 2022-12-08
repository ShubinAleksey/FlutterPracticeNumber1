import 'package:dartz/dartz.dart';
import 'package:flutter_practice_2/common/data_base_request.dart';
import 'package:flutter_practice_2/core/db/data_base_helper.dart';
import 'package:flutter_practice_2/data/model/users.dart';
import 'package:flutter_practice_2/domain/entity/role_entity.dart';
import 'package:flutter_practice_2/domain/repositories/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';

class AuthReposityImpl implements AuthRepositories {
  final _db = DataBaseHelper.instance.database;
  @override
  String table = DataBaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> signIn(String login, String password) async {
    try {
      var user = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );

      if (user.isEmpty) {
        return const Left('Такого пользователя нет');
      }

      if (user.first['password'] != password) {
        return const Left('Пароль пользователя неверный');
      }

      return Right(RoleEnum.values[(user.first['id_role'] as int) - 1]);
    } on DatabaseException catch (error) {
      return Left(error.result.toString());
    }
  }

  @override
  Future<Either<String, bool>> signUp(
    String login, 
    String password,
    String name,
    String surname,
    String middleName,
    String seriaPassport,
    String nomerPassport) async {
    try {
      _db.insert(
        table,
        Users(login: login, password: password, name: name, surname: surname, middleName: middleName, seriaPassport: seriaPassport, nomerPassport: nomerPassport, idRole: RoleEnum.admin).toMap(),
      );
      return Right(true);
    } on DatabaseException catch (error) {
      return Left('Ошибка');
    }
  }
}