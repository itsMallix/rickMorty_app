import 'package:bigio_test/services/services_db_provider.dart';
import 'package:bigio_test/view/screen_favorite/screen_favorite_card.dart';
import 'package:bigio_test/view/screen_favorite/screen_favorite_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFavorite extends StatefulWidget {
  const ScreenFavorite({Key? key});

  @override
  State<ScreenFavorite> createState() => _ScreenFavoriteState();
}

class _ScreenFavoriteState extends State<ScreenFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFavoriteScreen(),
    );
  }

  Widget buildFavoriteScreen() {
    return Consumer<DbManager>(
      builder: (context, value, child) {
        if (value.characters.isNotEmpty) {
          return FavCharacterList(manager: value);
        } else {
          return const EmptyCharacterScreen();
        }
      },
    );
  }
}
