// import 'package:bigio_test/services/services_db_provider.dart';
// import 'package:bigio_test/view/screen_favorite/screen_favorite_empty.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ScreenFavorite extends StatelessWidget {
//   const ScreenFavorite({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: buildFavoriteScreen(),
//     );
//   }

//   Widget buildFavoriteScreen() {
//     return Consumer<DbManager>(
//       builder: (context, value, child) {
//         if (value.characters.isEmpty) {
//           return Container();
//         } else {
//           return const EmptyCharacterScreen();
//         }
//       },
//     );
//   }
// }

import 'package:bigio_test/services/services_db_provider.dart';
import 'package:bigio_test/view/screen_favorite/screen_favorite_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFavorite extends StatelessWidget {
  const ScreenFavorite({Key? key});

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
          // Jika ada favorite karakter, tampilkan dalam ListView
          return ListView.builder(
            itemCount: value.characters.length,
            itemBuilder: (context, index) {
              final character = value.characters[index];
              return ListTile(
                title: Text(character.name ?? ''),
                // Tambahkan widget lain sesuai kebutuhan
              );
            },
          );
        } else {
          // Jika tidak ada favorite karakter, tampilkan EmptyCharacterScreen
          return const EmptyCharacterScreen();
        }
      },
    );
  }
}
