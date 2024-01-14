import 'package:bigio_test/services/services_search.dart';
import 'package:bigio_test/view/screen_favorite/screen_favorite.dart';
import 'package:bigio_test/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:bigio_test/component/theme/color_system.dart';
import 'package:bigio_test/component/theme/text_system.dart';
import 'package:bigio_test/view/screen_character/screen_character.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ScreenHome(),
    // const Test(),
    const ScreenCharacter(),
    const ScreenFavorite(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rick and Morty App",
          style: TextSystem.headlineMedium.copyWith(color: ColorSystem.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchService());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorSystem.lightPink,
        unselectedItemColor: ColorSystem.lightGrey,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _currentIndex == 0
                  ? ColorSystem.lightPink
                  : ColorSystem.lightGrey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pest_control_rounded,
              color: _currentIndex == 1
                  ? ColorSystem.lightPink
                  : ColorSystem.lightGrey,
            ),
            label: "Character",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              color: _currentIndex == 2
                  ? ColorSystem.lightPink
                  : ColorSystem.lightGrey,
            ),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
