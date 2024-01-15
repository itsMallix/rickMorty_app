import 'package:bigio_test/view/screen_home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bigio_test/main.dart';

void main() {
  testWidgets("Find Text Title", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: ScreenHome(),
      ),
    );
    expect(find.byType(ScreenHome), findsOneWidget);
  });
  testWidgets("Find Text Title", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: ScreenHome(),
      ),
    );
    expect(find.text("Example Character"), findsOneWidget);
  });
}
