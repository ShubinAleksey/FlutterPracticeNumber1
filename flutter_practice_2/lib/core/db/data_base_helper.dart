import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DataBaseHelper{
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;


  Future<void> init() async {
    _appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  }
}