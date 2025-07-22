import 'package:path/path.dart';

import '../models/note.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseService {


static final DatabaseService instance = DatabaseService._init();

  static Database? _database;
  final String _CREATE_QUERY = '''
                CREATE TABLE notes(
                  id TEXT PRIMARY KEY, 
                  title TEXT NOT NULL, 
                  content TEXT NOT NULL,
                  dateCreated TEXT NOT NULL,
                  dateUpdated TEXT NOT NULL
                )''';

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database?> _initDB(String dbfileName) async {
    var fullDBPath = join(await getDatabasesPath(), dbfileName);
    return openDatabase(fullDBPath, 
      version: 1, 
      onCreate: (db, version) {

        return db.execute(_CREATE_QUERY);
      }
    );
  }

  Future<void> createNote(Note note) async {
    final database = await instance.database;
    await database.insert('notes', note.toJson());
  }

  Future<List<Note>> getNotes() async {
    final database = await instance.database;
    final results = await database.query('notes', orderBy: 'dateCreated DESC');
  return results.map((json) => Note.fromJson(json)).toList();
  }

}