import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:map_box_app/app/config/map_config.dart';
import 'package:http/http.dart' as http;
import 'package:map_box_app/app/features/map_box/data/models/coordinate_model.dart';
import 'package:map_box_app/app/features/map_box/data/models/search_suggestions_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../../../../core/exceptions/network_exception.dart';

class MapBoxService {
  final accessToken = MapConfig.publicAccessKey;
  final directionsBaseUrl = MapConfig.baseUrlDirection;
  final suggestBaseUrl = MapConfig.baseUrlSearch;

  // Generate session token
  String _generateSessionToken() {
    final random = Random();
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(16, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  // fetch route
  Future<List<Position>> fetchRouteService(List<Position> coordinates) async {
    if (coordinates.length < 2) return [];
    final coordinatesString =
        coordinates.map((pos) => '${pos.lng},${pos.lat}').join(';');
    final url =
        "$directionsBaseUrl/$coordinatesString?geometries=geojson&access_token=$accessToken";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final geometry = data['routes'][0]['geometry'];
        final List<dynamic> routeCoordinates = geometry['coordinates'];

        List<Position> routePoints = routeCoordinates
            .map((coordinate) => Position(coordinate[0], coordinate[1]))
            .toList();

        return routePoints;
      } else {
        throw NetworkException(statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      throw Exception("No Internet connection: ${e.message}");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  // fetch search suggestions
  Future<SearchSuggestionsModel?> fetchSearchSuggestions(String query) async {
    if (query.isEmpty) return null;

    final sessionToken = _generateSessionToken();
    final url =
        "$suggestBaseUrl/suggest?q=${Uri.encodeComponent(query)}&access_token=$accessToken&session_token=$sessionToken";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return SearchSuggestionsModel.fromJson(data);
      } else {
        throw NetworkException(statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      throw Exception("No Internet connection: ${e.message}");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  // fetch complete suggestions
  Future<CoordinateModel?> fetchCompleteSuggestion(String id) async {
    if (id.isEmpty) return null;

    final sessionToken = _generateSessionToken();
    final url =
        "$suggestBaseUrl/retrieve/${Uri.encodeComponent(id)}?session_token=$sessionToken&access_token=$accessToken";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return CoordinateModel.fromJson(data);
      } else {
        throw NetworkException(statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      throw Exception("No Internet connection: ${e.message}");
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
