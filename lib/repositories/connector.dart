import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

Database db;

class DatabaseConnector {
  static void databaseLog(String functionName, String sql, [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult]) {
    print(functionName);
    print(sql);
    if(selectQueryResult != null) {
      print(selectQueryResult);
    } else if(insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createSettingTable(Database db) async {
    String sql = 'CREATE TABLE IF NOT EXISTS settings ( id INTEGER PRIMARY KEY, name TEXT NOT NULL, value TEXT )';
    await db.execute(sql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = databasePath + '/' + dbName;

    if (await Directory(dirname(path)).exists()) {
    //  Do nothing
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('bbdLocal.db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    print('is running !');
    await createSettingTable(db);
  }

}