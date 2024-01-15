import 'package:bigio_test/model/model_character.dart';
import 'package:sqflite/sqflite.dart';

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

  final String characterTable = "favoriteCharacters";

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      "favoriteCharacters.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $characterTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        status TEXT,
        species TEXT,
        type TEXT,
        gender TEXT,
        image TEXT
      )''');
      },
    );
    return db;
  }

  Future<void> addCharacter(
    int id,
    String name,
    String status,
    String species,
    String type,
    String gender,
    String image,
  ) async {
    try {
      final Database db = await database;
      await db.insert(characterTable, {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'image': image,
      });
    } catch (e) {
      print("Error adding character: $e");
    }
  }

  Future<List<Character>> getCharacters() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(characterTable);
    return result.map((e) => Character.fromJson(e)).toList();
  }

  Future<Character> getCharacterById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      characterTable,
      where: "id = ?",
      whereArgs: [id],
    );
    return result.map((e) => Character.fromJson(e)).first;
  }

  Future<void> deleteCharacter(int id) async {
    final Database db = await database;
    await db.delete(
      characterTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
