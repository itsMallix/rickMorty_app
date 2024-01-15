import 'package:bigio_test/component/theme/text_system.dart';
import 'package:flutter/material.dart';

class EmptyCharacterScreen extends StatelessWidget {
  const EmptyCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 220),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  "assets/images/empty.png",
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "No Favorite Character",
                style: TextSystem.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
