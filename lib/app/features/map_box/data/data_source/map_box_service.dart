import 'dart:convert';

import 'package:map_box_app/app/config/map_config.dart';
import 'package:http/http.dart' as http;
import 'package:map_box_app/app/features/map_box/data/models/search_suggestions_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapBoxService {
  final accessToken = MapConfig.publicAccessKey;
  final directionsBaseUrl = MapConfig.baseUrlDirection;
  final suggestBaseUrl = MapConfig.baseUrlSuggest;

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
        throw Exception('Failed to fetch route : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }

  // fetch search suggestions
  Future<SearchSuggestionsModel?> fetchSearchSuggestions(String query) async {
    if (query.isEmpty) return null;

    final url = "$suggestBaseUrl?q=$query&access_token=$accessToken";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return SearchSuggestionsModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch route : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception("An unexpected error occurred: $e");
    }
  }
}
