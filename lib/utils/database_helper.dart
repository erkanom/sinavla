import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'Questions.db';
  static final columnId = '_id';

  static Database _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //singleton structure
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // index lesson topic image general structure of a database
  //index auto increment
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE my_table (
            Lesson TEXT,
            Topic TEXT,
            Path TEXT
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('my_table', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query('my_table');
  }

  Future<int> delete(String path) async {
    Database db = await instance.database;
    return await db
        .delete('my_table', where: 'path = ?', whereArgs: ['./anan']);
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete('my_table');
  }
}
