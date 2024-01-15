import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/services/services_db_provider.dart';
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
          final favoriteItem = manager.characters;
          return ListView.builder(
            itemCount: favoriteItem.length,
            itemBuilder: (context, index) {
              final items = favoriteItem[index];
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 10.0,
                  right: 12.0,
                  left: 12.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorSystem.lightGrey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (items.image!.isNotEmpty)
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image(
                                  image: NetworkImage(items.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (items.image!.isEmpty)
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: ColorSystem.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.image,
                                color: ColorSystem.black,
                              ),
                            ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180,
                                child: Text(
                                  items.name!,
                                  style: TextSystem.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                items.species ?? 'N/A',
                                style: TextSystem.bodyMedium,
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Delete Caracter From Favorite?',
                                    style: TextSystem.headlineMedium,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        manager.deleteCharacter(items.id!);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Delete',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              height: 80,
                              width: 60,
                              decoration: BoxDecoration(
                                color: ColorSystem.lightRed,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: ColorSystem.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
