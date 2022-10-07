/// Класс отвечающий за запросы к базе данных
abstract class DataBaseRequest {
  
  static const String tableRole = 'Role';
  
  static const String tableUsers = 'Users';

  static const String tableTypeTovar = 'TypeTovar';

  static const String tableColorTovar = 'ColorTovar';

  static const String tableSizeTovar = 'SizeTovar';

  static const String tableTovar = 'Tovar';

  static const String tableClient = 'Client';
  
  static const String tableFavorites = 'Favorites';

  static const String tableOrder = 'Order';

  static const String tableOrderClient = 'OrderClient';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableTypeTovar,
    tableColorTovar,
    tableSizeTovar,
    tableTovar,
    tableClient,
    tableFavorites,
    tableOrder,
    tableOrderClient,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableTypeTovar,
    _createTableColorTovar,
    _createTableSizeTovar,
    _createTableTovar,
    _createTableClient,
    _createTableFavorites,
    _createTableOrder,
    _createTableOrderClient,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER, "role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER, "login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE, PRIMARY KEY("id"))';

  static const String _createTableTypeTovar =
      'CREATE TABLE "$tableTypeTovar" ("id" INTEGER, "NameType" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';
  
  static const String _createTableColorTovar =
      'CREATE TABLE "$tableColorTovar" ("id" INTEGER, "NameColor" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';

  static const String _createTableSizeTovar =
      'CREATE TABLE "$tableSizeTovar" ("id" INTEGER, "SizeColor" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';
  
  static const String _createTableTovar =
      'CREATE TABLE "$tableTovar" ("id" INTEGER, "NameTovar" TEXT NOT NULL UNIQUE, "Date" TEXT NOT NULL, "PriceTovar" REAL NOT NULL, "id_typetovar" INTEGER,FOREIGN KEY("id_typetovar") REFERENCES "TypeTovar"("id"), "id_colortovar" INTEGER,FOREIGN KEY("id_colortovar") REFERENCES "ColorTovar"("id"), "id_sizetovar" INTEGER,FOREIGN KEY("id_sizetovar") REFERENCES "SizeTovar"("id"), PRIMARY KEY("id"), ON DELETE CASCADE)';

  static const String _createTableClient =
      'CREATE TABLE "$tableClient" ("id" INTEGER, "Name" TEXT NOT NULL, "Surname" TEXT NOT NULL, "Telephone" INTEGER NOT NULL UNIQUE, "Email" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';

  static const String _createTableFavorites =
      'CREATE TABLE "$tableFavorites" ("id" INTEGER, "id_tovar" INTEGER,FOREIGN KEY("id_tovar") REFERENCES "Tovar"("id"), "id_client" INTEGER,FOREIGN KEY("id_client") REFERENCES "Client"("id"), PRIMARY KEY("id"), ON DELETE CASCADE)';
  
  static const String _createTableOrder =
      'CREATE TABLE "$tableOrder" ("id" INTEGER, "NameOrder" TEXT NOT NULL UNIQUE, PRIMARY KEY("id"))';

  static const String _createTableOrderClient =
      'CREATE TABLE "$tableOrderClient" ("id" INTEGER, "NumberOrder" INTEGER NOT NULL UNIQUE, "NumberTaken" INTEGER NOT NULL, "id_client" INTEGER,FOREIGN KEY("id_client") REFERENCES "Client"("id"), "id_order" INTEGER,FOREIGN KEY("id_order") REFERENCES "Order"("id"), "id_users" INTEGER,FOREIGN KEY("id_users") REFERENCES "Users"("id"), PRIMARY KEY("id"), ON DELETE CASCADE)'; 
static String deleteTable(String table) => 'DROP TABLE $table';
}