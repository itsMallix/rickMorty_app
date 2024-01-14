import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/model/model_character.dart';
import 'package:bigio_test/services/services_api.dart';
import 'package:bigio_test/view/screen_detail/screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchService extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final characterProvider = Provider.of<ApiProvider>(context);

    Widget circleLoading() {
      return const Center(
        child: CircularProgressIndicator(
          color: ColorSystem.lightPurple,
        ),
      );
    }

    if (query.isEmpty) {
      return circleLoading();
    }
    return FutureBuilder(
      future: characterProvider.findCharacters(query),
      builder: (context, AsyncSnapshot<List<Character>> snapshot) {
        if (!snapshot.hasData) {
          return circleLoading();
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final character = snapshot.data![index];
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenDetail(character: character),
                  ),
                );
              },
              title: Text(character.name!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(character.image!),
              ),
            );
          },
        );
      },
    );
  }
}
