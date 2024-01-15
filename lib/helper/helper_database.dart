import 'package:bigio_test/model/model_character.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  Future<Database> get database async {
    _database = await _initializeDb();
    return _database!;
  }

  final String tableName = "favoriteCharacters";

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      "favoriteCharacters.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT
        )''');
      },
    );
    return db;
  }

  Future<void> addCharacter(Character characterModel) async {
    final Database db = await database;
    await db.insert(tableName, characterModel.toJson());
  }

  Future<List<Character>> getCharacters() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(tableName);
    return result.map((e) => Character.fromJson(e)).toList();
  }

  Future<Character> getCharacterById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.map((e) => Character.fromJson(e)).first;
  }

  Future<void> deleteCharacter(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
