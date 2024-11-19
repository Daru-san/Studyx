import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../subjects/subject.dart';

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper;
  DatabaseHelper._createInstance();

  static String subjectTable = Subject.tableName;

  static String colid = Subject.colums[0];
  static String colname = Subject.colums[1];
  static String colteacher = Subject.colums[2];
  static String colroom = Subject.colums[3];

  factory DatabaseHelper() {
    _databaseHelper = DatabaseHelper._createInstance();
    return _databaseHelper;
  }
  Future<Database> get database async {
    _database = await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = "${directory.path}subject.db";

    var subjectDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return subjectDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE $subjectTable(
        $colid INTEGER PRIMARY KEY AUTOINCREMENT,
        $colname TEXT NOT NULL,
        $colteacher TEXT NOT NULL,
        $colroom TEXT NOT NULL,
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getSubjectMapList() async {
    Database db = await database;
    var result = db.rawQuery("SELECT * FROM $subjectTable ORDER BY $colid ASC");
    return result;
  }

  Future<int> insertSubject(Subject subject) async {
    Database db = await database;
    var result = await db.insert(subjectTable, subject.toMap());
    return result;
  }

  Future<int> updateSubject(Subject subject) async {
    var db = await database;
    var result = await db.update(subjectTable, subject.toMap(),
        where: '$colid = ?', whereArgs: [subject.id]);
    return result;
  }

  Future<int> deleteSubject(int id) async {
    var db = await database;
    var result =
        await db.delete(subjectTable, where: "$colid = ?", whereArgs: [id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery("SELECT COUNT (*) from $subjectTable");
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }

  Future<List<Subject>> getSubjectList() async {
    var subjectMapList = await getSubjectMapList();
    int count = subjectMapList.length;
    List<Subject> subjectList = [];
    for (int i = 0; i < count; i++) {
      subjectList.add(Subject.fromMap(subjectMapList[i]));
    }
    return subjectList;
  }
}
