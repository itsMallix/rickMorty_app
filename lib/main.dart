import 'package:bigio_test/services/services_api_provider.dart';
import 'package:bigio_test/services/services_db_provider.dart';
import 'package:bigio_test/view/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ricky and Morty App',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
