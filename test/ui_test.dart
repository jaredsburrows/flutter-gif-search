import 'package:flutter/material.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Check the AppBar', () {
    testWidgets('Verify AppBar is showing the title', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Top Trending Gifs'), findsOneWidget);
      expect(find.widgetWithText(AppBar, 'Top Trending Gifs'), findsOneWidget);
    });

    testWidgets('Verify AppBar is showing the search icon', (tester) async {
      await tester.pumpWidget(const MyApp());

      final BuildContext context = tester.element(find.byType(MyApp));
      final searchIcon = find.byIcon(PlatformIcons(context).search);
      expect(searchIcon, findsOneWidget);

      final searchIconToolTip = find.byTooltip('Search gifs');
      expect(searchIconToolTip, findsOneWidget);
    });

    testWidgets('Verify AppBar is showing the more icon', (tester) async {
      await tester.pumpWidget(const MyApp());

      final moreIcon = find.byIcon(Icons.adaptive.more);
      expect(moreIcon, findsOneWidget);

      final moreIconToolTip = find.byTooltip('Show menu');
      expect(moreIconToolTip, findsOneWidget);
    });

    testWidgets('Verify AppBar click and show more menu items', (tester) async {
      await tester.pumpWidget(const MyApp());

      final moreIcon = find.byIcon(Icons.adaptive.more);

      await tester.tap(moreIcon);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Open Source Licenses'), findsOneWidget);
    });
  });

  group('Check the Gif List', () {
    testWidgets('Verify GridView is showing', (tester) async {
      await tester.pumpWidget(const MyApp());

      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);

      final gridView = tester.firstWidget(gridViewFinder) as GridView;
      expect(
        (gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount)
            .crossAxisCount,
        3,
      );
    });
  });
}
