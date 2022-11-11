/// Класс отвечающий за запросы к базе данных
abstract class DataBaseRequest {
  
  static const String tableRole = 'Role';
  
  static const String tableUsers = 'Users';

  static const String tableTypeTovar = 'TypeTovar';

  static const String tableColorTovar = 'ColorTovar';

  static const String tableSizeTovar = 'SizeTovar';

  static const String tableTovar = 'Tovar';
  
  static const String tableFavorites = 'Favorites';

  static const String tableOrderTovar = 'OrderTovar';

  static const String tableOrderClient = 'OrderClient';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableTypeTovar,
    tableColorTovar,
    tableSizeTovar,
    tableTovar,
    tableFavorites,
    tableOrderTovar,
    tableOrderClient,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableTypeTovar,
    _createTableColorTovar,
    _createTableSizeTovar,
    _createTableTovar,
    _createTableFavorites,
    _createTableOrderTovar,
    _createTableOrderClient,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      '''CREATE TABLE "$tableRole" (
        "id" INTEGER, 
        "role" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      '''CREATE TABLE "$tableUsers" (
        "id" INTEGER, 
        "login"	TEXT NOT NULL UNIQUE,
        "password" TEXT NOT NULL,
        "name" TEXT NOT NULL,
        "surname" TEXT NOT NULL,
        "middleName" TEXT,
        "seriaPass" INTEGER NOT NULL,
        "nomerPass" INTEGER NOT NULL,
        "id_role"	INTEGER,
        FOREIGN KEY("id_role") REFERENCES "$tableRole"("id") ON DELETE CASCADE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableTypeTovar =
      '''CREATE TABLE "$tableTypeTovar" (
        "id" INTEGER, 
        "nameType" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';
  
  static const String _createTableColorTovar =
      '''CREATE TABLE "$tableColorTovar" (
        "id" INTEGER, 
        "nameColor" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableSizeTovar =
      '''CREATE TABLE "$tableSizeTovar" (
        "id" INTEGER, 
        "nameSize" TEXT NOT NULL UNIQUE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';
  
  static const String _createTableTovar =
      '''CREATE TABLE "$tableTovar" (
        "id" INTEGER, 
        "nameTovar" TEXT NOT NULL UNIQUE, 
        "date" TEXT NOT NULL, 
        "priceTovar" REAL NOT NULL, 
        "id_typetovar" INTEGER, 
        "id_colortovar" INTEGER,
        "id_sizetovar" INTEGER,
        FOREIGN KEY("id_typetovar") REFERENCES "$tableTypeTovar"("id") ON DELETE CASCADE, 
        FOREIGN KEY("id_colortovar") REFERENCES "$tableColorTovar"("id") ON DELETE CASCADE, 
        FOREIGN KEY("id_sizetovar") REFERENCES "$tableSizeTovar"("id") ON DELETE CASCADE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableFavorites =
      '''CREATE TABLE "$tableFavorites" (
        "id" INTEGER, 
        "id_tovar" INTEGER, 
        "id_users" INTEGER,
        FOREIGN KEY("id_tovar") REFERENCES "$tableTovar"("id") ON DELETE CASCADE, 
        FOREIGN KEY("id_users") REFERENCES "$tableUsers"("id") ON DELETE CASCADE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

  static const String _createTableOrderTovar =
      '''CREATE TABLE "$tableOrderTovar" (
        "id" INTEGER, 
        "NameOrder" TEXT NOT NULL UNIQUE,
        "id_tovar" INTEGER,
        FOREIGN KEY("id_tovar") REFERENCES "$tableTovar"("id") ON DELETE CASCADE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';
  
  static const String _createTableOrderClient =
      '''CREATE TABLE "$tableOrderClient" (
        "id" INTEGER, 
        "numberOrder" INTEGER NOT NULL UNIQUE, 
        "numberTaken" INTEGER NOT NULL, 
        "id_order" INTEGER, 
        "id_users" INTEGER, 
        FOREIGN KEY("id_order") REFERENCES "$tableOrderTovar"("id") ON DELETE CASCADE, 
        FOREIGN KEY("id_users") REFERENCES "$tableUsers"("id") ON DELETE CASCADE, 
        PRIMARY KEY("id" AUTOINCREMENT))''';

        static String deleteTable(String tableName) =>'drop table $tableName';
}