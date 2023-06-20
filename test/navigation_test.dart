import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Click on "Open Source Licenses" should navigate to "Licenses" screen',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.adaptive.more));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Open Source Licenses'), findsOneWidget);

    await tester.tap(find.text('Open Source Licenses'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Licenses'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Licenses'), findsOneWidget);
  });

  testWidgets('Click back button on "Licenses" screen, should navigate to Home',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.adaptive.more));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.text('Open Source Licenses'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.adaptive.arrow_back));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Top Trending Gifs'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Top Trending Gifs'), findsOneWidget);
  });
}
