import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Click on "Open Source Licenses" should navigate to "Licenses" screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final moreIcon = find.byIcon(Icons.adaptive.more);

    await tester.tap(moreIcon);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(find.text('Open Source Licenses'), findsOneWidget);

    await tester.tap(find.text('Open Source Licenses'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    expect(find.text('Licenses'), findsOneWidget);
    expect(find.widgetWithText(AppBar, 'Licenses'), findsOneWidget);
  });
}
