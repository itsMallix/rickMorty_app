import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/model/model_character.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final Character character;
  final Function() onPressed;
  const FavoriteCard({
    super.key,
    required this.character,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                if (character.image!.isNotEmpty)
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image(
                        image: NetworkImage(character.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                if (character.image!.isEmpty)
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
                        character.name!,
                        style: TextSystem.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Status : ${character.status!}",
                      style: TextSystem.bodyMedium.copyWith(
                        color: ColorSystem.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Species : ${character.species}",
                      style: TextSystem.bodyMedium,
                    ),
                    Text(
                      "Gender : ${character.gender!}",
                      style: TextSystem.bodyMedium,
                    )
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
                            onPressed: onPressed,
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
                    width: 50,
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
  }
}
