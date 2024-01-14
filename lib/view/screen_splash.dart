import 'package:bigio_test/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';

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
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ScreenHome()),
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