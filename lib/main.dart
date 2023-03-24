import 'package:flutter/widgets.dart';
import 'package:flutter_gif_search/main_application.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}
