import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapConfig {
  static String get publicAccessKey => dotenv.env['PUBLIC_ACCESS_KEY'] ?? '';
  static String get baseUrlDirection => dotenv.env['BASE_URL_DIRECTION'] ?? '';
}
