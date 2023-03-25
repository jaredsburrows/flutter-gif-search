import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check the AppBar', () {
    testWidgets('Verify AppBar is showing the title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Top Trending Gifs'), findsOneWidget);
      expect(find.widgetWithText(AppBar, 'Top Trending Gifs'), findsOneWidget);
    });

    testWidgets('Verify AppBar is showing the search icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final searchIcon = find.byIcon(Icons.search);
      expect(searchIcon, findsOneWidget);

      final searchIconToolTip = find.byTooltip('Search gifs');
      expect(searchIconToolTip, findsOneWidget);
    });

    testWidgets('Verify AppBar is showing the more icon',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final moreIcon = find.byIcon(Icons.adaptive.more);
      expect(moreIcon, findsOneWidget);

      final moreIconToolTip = find.byTooltip('Show menu');
      expect(moreIconToolTip, findsOneWidget);
    });

    testWidgets('Verify AppBar click and show more menu items',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final moreIcon = find.byIcon(Icons.adaptive.more);

      await tester.tap(moreIcon);
      await tester.pump();
      await tester
          .pump(const Duration(seconds: 1)); // finish the menu animation

      expect(find.text('Open Source Licenses'), findsOneWidget);
    });
  });

  group('Check the Gif List', () {
    testWidgets('Verify GridView is showing', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);

      GridView gridView = tester.firstWidget(gridViewFinder);
      expect(
          (gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount)
              .crossAxisCount,
          3);
    });
  });
}
