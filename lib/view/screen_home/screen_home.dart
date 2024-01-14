import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/services/services_api.dart';
import 'package:bigio_test/view/screen_detail/screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getCharacters(1);
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: ColorSystem.normalCyan,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        "assets/images/banner.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.transparent],
                        stops: [0, .8],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get Character Data By API",
                          style: TextSystem.headlineMedium.copyWith(
                            color: ColorSystem.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: Text(
                            "Discover an amazing world of characters with our app! Get exclusive access to characters from multiple sources through the API",
                            style: TextSystem.bodyMedium.copyWith(
                              color: ColorSystem.white,
                            ),
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    "Example Character",
                    style: TextSystem.headlineMedium,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "show more",
                      style: TextSystem.bodyMedium.copyWith(
                        color: ColorSystem.normalBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: apiProvider.characters.isNotEmpty
                    ? CharacterList(
                        apiProvider: apiProvider,
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: ColorSystem.lightPurple,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterList extends StatelessWidget {
  final ApiProvider apiProvider;
  const CharacterList({super.key, required this.apiProvider});

  @override
  Widget build(BuildContext context) {
    int itemCount = 7;
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final character = apiProvider.characters[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenDetail(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: ColorSystem.lightOrange,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorSystem.lightGrey,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image(
                      image: NetworkImage(character.image!),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        ColorSystem.black,
                        Colors.transparent,
                      ],
                      stops: [0, .8],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: SizedBox(
                    width: 100,
                    child: Text(
                      character.name!,
                      style: TextSystem.labelMedium.copyWith(
                        color: ColorSystem.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
