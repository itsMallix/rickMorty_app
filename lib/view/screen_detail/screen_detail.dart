import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/helper/helper_database.dart';
import 'package:bigio_test/model/model_character.dart';
import 'package:bigio_test/services/services_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenDetail extends StatefulWidget {
  final Character character;
  const ScreenDetail({super.key, required this.character});

  @override
  State<ScreenDetail> createState() => _ScreenDetailState();
}

class _ScreenDetailState extends State<ScreenDetail> {
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  Future<void> _addToFavorite() async {
    await _databaseHelper.addCharacter(
      widget.character.id!,
      widget.character.name!,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "${widget.character.name} added to favorite",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Character Details",
          style: TextSystem.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image(
                    image: NetworkImage(widget.character.image!),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.transparent],
                      stops: [0, .8],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        const Text(
                          "Ricky and Morty Characters",
                          style: TextSystem.bodyMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.character.name!,
                          textAlign: TextAlign.center,
                          style: TextSystem.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCardData("Status", widget.character.status!),
                  buildCardData("Species", widget.character.species!),
                  buildCardData("Origin", widget.character.origin!.name!),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              width: double.infinity,
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCardData("Gender", widget.character.gender!),
                  buildCardData("Type", widget.character.type ?? "N/A"),
                  buildCardData("Location", widget.character.location!.name!),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Episodes", style: TextSystem.headlineMedium),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListEpisode(character: widget.character),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: ColorSystem.lightBlue,
        ),
        child: GestureDetector(
          onTap: () async {
            _addToFavorite();
          },
          child: Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: ColorSystem.darkRed,
              boxShadow: const [
                BoxShadow(
                  color: ColorSystem.black,
                ),
              ],
            ),
            child: Center(
                child: Text(
              "Add To Favorites",
              style: TextSystem.headlineSmall.copyWith(
                color: ColorSystem.white,
              ),
            )),
          ),
        ),
      ),
    );
  }

  Widget buildCardData(String title, String content) {
    return Expanded(
      child: Card(
        color: ColorSystem.normalBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: TextSystem.bodyLarge.copyWith(
                color: ColorSystem.white,
              ),
            ),
            Text(
              content,
              style: TextSystem.bodySmall.copyWith(
                color: ColorSystem.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class ListEpisode extends StatefulWidget {
  final Character character;
  const ListEpisode({super.key, required this.character});

  @override
  State<ListEpisode> createState() => _ListEpisodeState();
}

class _ListEpisodeState extends State<ListEpisode> {
  @override
  void initState() {
    super.initState();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.getEpisodes(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        itemCount: apiProvider.episodes.length,
        itemBuilder: (context, index) {
          final episode = apiProvider.episodes[index];
          return ListTile(
            leading: Text(
              episode.episode!,
              style: TextSystem.labelSmall,
            ),
            title: Text(
              episode.name!,
              style: TextSystem.labelMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              episode.airDate!,
              style: TextSystem.labelSmall,
            ),
          );
        },
      ),
    );
  }
}
