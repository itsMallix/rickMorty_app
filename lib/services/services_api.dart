import 'package:bigio_test/model/model_character.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final url = "rickandmortyapi.com";
  List<Character> characters = [];

  Future<void> getCharacters(int page) async {
    final result = await http.get(
      Uri.https(
        url,
        "/api/character",
        {
          "page": page.toString(),
        },
      ),
    );
    final response = characterResponseFromJson(result.body);
    characters.addAll(response.results!);
    notifyListeners();
    // print(response.results);
  }
}
