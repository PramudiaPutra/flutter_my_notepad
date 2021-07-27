import 'dart:io';
import 'package:my_notepad/model/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  Database? _database;

  Future<Database> get database async =>
      _database ??= await getDatabaseInstance();

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'notes.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Notes('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          ' title TEXT,'
          ' note TEXT)');
    });
  }

  addNote(Note note) async {
    final db = await database;
    var data = await db.insert(
      'Notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return data;
  }
}
