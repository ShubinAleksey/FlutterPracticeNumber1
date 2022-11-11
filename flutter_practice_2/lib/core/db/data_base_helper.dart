import 'dart:io';

import 'package:flutter_practice_2/common/data_base_request.dart';
import 'package:flutter_practice_2/data/model/colortovar.dart';
import 'package:flutter_practice_2/data/model/role.dart';
import 'package:flutter_practice_2/data/model/sizetovar.dart';
import 'package:flutter_practice_2/data/model/typetovar.dart';
import 'package:flutter_practice_2/domain/entity/colorproduct_entity.dart';
import 'package:flutter_practice_2/domain/entity/role_entity.dart';
import 'package:flutter_practice_2/domain/entity/sizetovar_entity.dart';
import 'package:flutter_practice_2/domain/entity/typetovar_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  final int _version = 14;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'ShopClothesDB.db');

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onCreate: (db, version) => onCreateTable(db),
            onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
          ));
    } else if (Platform.isAndroid || Platform.isIOS) {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) async  => await  onCreateTable(db),
        onUpgrade: (db, oldVersion, newVersion) async => await onUpdateTable(db),
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var sql in DataBaseRequest.tableCreateList) {
      await db.execute(sql);
    }

    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for(var item in RoleEnum.values){
        db.insert(DataBaseRequest.tableRole, Role(role: item.name).toMap());
      }
      for(var item in SizeTovarEnum.values){
        db.insert(DataBaseRequest.tableSizeTovar, SizeTovar(nameSize: item.name).toMap());
      }
      for(var item in ColorProductEnum.values){
        db.insert(DataBaseRequest.tableColorTovar, ColorTovar(nameColor: item.name).toMap());
      }
      for(var item in TypeTovarEnum.values){
        db.insert(DataBaseRequest.tableTypeTovar, TypeTovar(nameType: item.name).toMap());
      }
    } on DatabaseException catch (e) {
      print(e.result);
    }
  }

  Future<void> onDropDataBase(String join) async {
     await database.close();

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
      deleteDatabase(_pathDB);
    else if (Platform.isAndroid || Platform.isIOS)
      await databaseFactoryFfi.deleteDatabase(_pathDB);
    }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        print(table);
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }

    await onInitTable(db);
  }
  }
