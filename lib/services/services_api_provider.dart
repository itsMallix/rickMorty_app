import 'package:bigio_test/model/model_character.dart';
import 'package:bigio_test/model/model_episode.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final url = "rickandmortyapi.com";
  List<Character> characters = [];
  List<Episode> episodes = [];

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
  }

  Future<List<Episode>> getEpisodes(Character character) async {
    episodes = [];
    for (var i = 0; i < character.episode!.length; i++) {
      final result = await http.get(Uri.parse(character.episode![i]));
      final respones = episodeResponseFromJson(result.body);
      episodes.add(respones);
      notifyListeners();
    }
    return episodes;
  }

  Future<List<Character>> findCharacters(String name) async {
    final result = await http.get(
      Uri.https(
        url,
        "/api/character",
        {
          "name": name,
        },
      ),
    );
    final response = characterResponseFromJson(result.body);
    return response.results!;
  }
}
