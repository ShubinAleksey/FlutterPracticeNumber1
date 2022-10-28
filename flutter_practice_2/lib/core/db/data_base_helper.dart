import 'dart:io';

import 'package:flutter_practice_2/common/data_base_request.dart';
import 'package:flutter_practice_2/data/model/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper{
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  int _version = 1;


  Future<void> init() async {
    _appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'shopclothesDB.db');
    
    if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      database = await openDatabase(join(await getDatabasesPath(), 'shopclothesDB.db'));
    } else {
      database = await openDatabase(
        _pathDB,
        onUpgrade: (db, oldVersion, newVersion) async {
          await onUpdateTable(db);
        }, 
        onCreate: (db, version) async {
          await onCreateTable(db);
        }
      );
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }

    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async{
    try{
      db.insert(DataBaseRequest.tableRole, Role(role: 'Администратор').toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: 'КассирПродавец').toMap());
    }on DatabaseException catch(e) {
      print(e.result);
    }
  }

  Future<void> onDropDataBase(String join) async {
    database.close();
    if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      deleteDatabase(_pathDB);
    } else {
      await databaseFactoryFfi.deleteDatabase(_pathDB);
    }
  }
  
  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master;');

    for (var table in DataBaseRequest.tableList.reversed) {
      if(tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    for (var element in DataBaseRequest.tableCreateList) {
      await db.execute(element);
    }

    await onInitTable(db);
  }
}