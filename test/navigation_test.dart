import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Click on "Open Source Licenses" should navigate to "Licenses" screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.adaptive.more));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(find.text('Open Source Licenses'), findsOneWidget);

    await tester.tap(find.text('Open Source Licenses'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish animation

    expect(find.text('Licenses'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Licenses'), findsOneWidget);
  });

  testWidgets('Click back button on "Licenses" screen, should navigate to Home',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.adaptive.more));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    await tester.tap(find.text('Open Source Licenses'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish animation

    await tester.tap(find.byIcon(Icons.adaptive.arrow_back));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish animation

    expect(find.text('Top Trending Gifs'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Top Trending Gifs'), findsOneWidget);
  });
}
