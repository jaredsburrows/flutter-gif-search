import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check Theme', () {
    final elements = {
      // App
      "App": find.byType(PlatformApp),
      // AppBar
      "AppBar": find.byType(AppBar),
      "AppBar Title": find.text('Top Trending Gifs'),
      "AppBar Search Icon": find.byIcon(Icons.search),
      "AppBar More Icon": find.byIcon(Icons.adaptive.more),
      // Gif List
      "Gif List": find.byType(GridView),
    };

    elements.forEach((name, element) {
      testWidgets(
          "Applies light theme and verify $name brightness is set to light",
          (WidgetTester tester) async {
        // Set the brightness to light mode
        tester.binding.window.platformDispatcher.platformBrightnessTestValue =
            Brightness.light;

        // Build the MyApp widget and trigger a frame
        await tester.pumpWidget(const MyApp());

        // Verify that the current theme brightness is set to light
        expect(Theme.of(tester.element(element)).brightness, Brightness.light);
      });

      testWidgets(
          "Applies dark theme and verify $name brightness is set to dark",
          (WidgetTester tester) async {
        // Set the brightness to dark mode
        tester.binding.window.platformDispatcher.platformBrightnessTestValue =
            Brightness.dark;

        // Build the MyApp widget and trigger a frame
        await tester.pumpWidget(const MyApp());

        // Verify that the current theme brightness is set to dark
        expect(Theme.of(tester.element(element)).brightness, Brightness.dark);
      });
    });
  });
}
