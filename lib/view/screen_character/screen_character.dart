import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/services/services_api_provider.dart';
import 'package:bigio_test/view/screen_detail/screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenCharacter extends StatefulWidget {
  const ScreenCharacter({super.key});

  @override
  State<ScreenCharacter> createState() => _ScreenCharacterState();
}

class _ScreenCharacterState extends State<ScreenCharacter> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getCharacters(page);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
        });
        page++;
        await apiProvider.getCharacters(page);
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
        height: double.infinity,
        width: double.infinity,
        child: apiProvider.characters.isNotEmpty
            ? CharacterList(
                apiProvider: apiProvider,
                isLoading: isLoading,
                scrollController: scrollController,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: ColorSystem.lightPurple,
                ),
              ),
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  final ApiProvider apiProvider;
  final bool isLoading;
  final ScrollController scrollController;

  const CharacterList({
    super.key,
    required this.apiProvider,
    required this.scrollController,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    int itemCount = apiProvider.characters.length;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: isLoading ? itemCount + 2 : itemCount,
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index < itemCount) {
          final character = apiProvider.characters[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenDetail(
                    character: character,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 0.5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image(
                      image: NetworkImage(character.image!),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    character.name!,
                    style: TextSystem.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorSystem.lightBlue,
            ),
          );
        }
      },
    );
  }
}
