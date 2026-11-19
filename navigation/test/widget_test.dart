import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigation/main.dart';

void main() {
  testWidgets('Navigation smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/second': (context) => SecondScreen(),
        },
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Go to Second Screen'), findsOneWidget);

    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    expect(find.text('Second Screen'), findsOneWidget);
  });
}