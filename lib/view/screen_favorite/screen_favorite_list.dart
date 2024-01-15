import 'package:bigio_test/services/services_db_provider.dart';
import 'package:bigio_test/view/screen_favorite/screen_favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavCharacterList extends StatelessWidget {
  final DbManager manager;
  const FavCharacterList({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Consumer<DbManager>(
        builder: (context, value, child) {
          final favoriteItem = manager.favCharacter;
          return ListView.builder(
            itemCount: favoriteItem.length,
            itemBuilder: (context, index) {
              final items = favoriteItem[index];
              return FavoriteCard(
                character: items,
                onPressed: () {
                  manager.deleteCharacter(items.id!);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Character deleted sucessfully"),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  // ListView FavoriteCard(List<Character> favoriteItem) {
  //   return ListView.builder(
  //     itemCount: favoriteItem.length,
  //     itemBuilder: (context, index) {
  //       final items = favoriteItem[index];
  //       return FavoriteCard(favoriteItem);
  //     },
  //   );
  // }
}
