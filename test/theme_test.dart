import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Theme', () {
    testWidgets('Applies light theme when brightness is set to light',
        (WidgetTester tester) async {
      // Set the brightness to light mode
      tester.binding.window.platformDispatcher.platformBrightnessTestValue =
          Brightness.light;

      // Build the MyApp widget and trigger a frame
      await tester.pumpWidget(const MyApp());

      // Verify that the current theme brightness is set to light
      final elements = [
        find.byType(PlatformApp),
        find.byType(AppBar),
        find.text('Top Trending Gifs'),
        find.byIcon(Icons.search),
        find.byIcon(Icons.adaptive.more)
      ];
      for (var element in elements) {
        expect(Theme.of(tester.element(element)).brightness, Brightness.light);
      }
    });

    testWidgets('Applies dark theme when brightness is set to dark',
        (WidgetTester tester) async {
      // Set the brightness to dark mode
      tester.binding.window.platformDispatcher.platformBrightnessTestValue =
          Brightness.dark;

      // Build the MyApp widget and trigger a frame
      await tester.pumpWidget(const MyApp());

      // Verify that the current theme brightness is set to dark
      final elements = [
        find.byType(PlatformApp),
        find.byType(AppBar),
        find.text('Top Trending Gifs'),
        find.byIcon(Icons.search),
        find.byIcon(Icons.adaptive.more)
      ];
      for (var element in elements) {
        expect(Theme.of(tester.element(element)).brightness, Brightness.dark);
      }
    });
  });
}
