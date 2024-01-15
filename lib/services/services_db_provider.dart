import 'package:bigio_test/helper/helper_database.dart';
import 'package:bigio_test/model/model_character.dart';
import 'package:flutter/material.dart';

class DbManager extends ChangeNotifier {
  List<Character> favCharacter = [];
  late DatabaseHelper _databaseHelper;

  List<Character> get characters => favCharacter;

  DbManager() {
    _databaseHelper = DatabaseHelper();
    _getAllCharacters();
  }

  void _getAllCharacters() async {
    favCharacter = await _databaseHelper.getCharacters();
    notifyListeners();
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
    await _databaseHelper.addCharacter(
      id,
      name,
      status,
      species,
      type,
      gender,
      image,
    );
    _getAllCharacters();
  }

  Future<Character> getCharacterById(int id) async {
    return await _databaseHelper.getCharacterById(id);
  }

  Future<void> deleteCharacter(int id) async {
    await _databaseHelper.deleteCharacter(id);
    _getAllCharacters();
  }
}
