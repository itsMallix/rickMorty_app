import 'package:bigio_test/model/model_character.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final _favoriteChar = <Character>[];
  List<Character> get favoriteCharacter => List.unmodifiable(_favoriteChar);

  void addToFavorite(Character character) {
    _favoriteChar.add(character);
    notifyListeners();
  }

  void removeFromFavorite(int index) {
    _favoriteChar.removeAt(index);
    notifyListeners();
  }
}
