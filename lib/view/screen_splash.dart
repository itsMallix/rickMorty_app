import 'package:flutter/material.dart';
import 'package:bigio_test/component/bottombar/bottombar.dart';

class ScreenSplash extends StatefulWidget {
  final Widget? child;
  const ScreenSplash({super.key, this.child});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const BottomBarScreen()),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset(
            "assets/images/splashLogo.png",
          ),
        ),
      ),
    );
  }
}
