import 'dart:async';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bonnou/models/rss_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _tableName = "rss";
  static Database? _db;
  static const _columnId = "id";
  static const _columnTitle = "title";
  static const _columnLink = "link";

  static Future<void> initDatabase() async {
    if (_db != null) {
      return;
    }
    try {
      final dbPath = await getDatabasesPath();
      String path = p.join(dbPath, '$_tableName.db');

      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName("
                "$_columnId INTEGER PRIMARY KEY AUTOINCREMENT, "
                "$_columnTitle STRING,"
                "$_columnLink TEXT "
                ")",
          );
        },
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error to open DB: ${error.toString()}');
      }
    }
  }

  static Future<int> insert(RssModel rss) async {
    return await _db?.insert(_tableName, rss.toJson()) ?? 1;
  }

  static Future<int> update(int id, RssModel rss) async {
    return await _db?.update(_tableName, rss.toJson(),
        where: 'id = ?', whereArgs: [rss.id]) ?? 1;
  }

  static Future<List<Map<String, dynamic>>?> query() async {
    return await _db?.query(_tableName, orderBy: "title ASC");
  }

  static Future<void> delete(RssModel rss) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [rss.id]);
  }

  static Future<List<Map<String, dynamic>>> queryRssById(int id) async {
    return await _db!.query(_tableName, where: '$_columnId=?', whereArgs: [id]);
  }
}