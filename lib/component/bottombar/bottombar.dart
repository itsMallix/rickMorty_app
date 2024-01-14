import 'package:bigio_test/view/screen_favorite/screen_favorite.dart';
import 'package:bigio_test/view/screen_home/screen_home.dart';
import 'package:bigio_test/view/screen_search/screen_search.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ScreenHome(),
    const ScreenSearch(),
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
    return Scaffold();
  }
}
