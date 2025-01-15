import 'package:map_box_app/app/features/map_box/domain/entities/suggestion_entity.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

abstract class MapBoxRepository {
  Future<List<Position>> fetchRoute(List<Position> coordinates);
  Future<List<SuggestionEntity>> searchSuggestion(String query);
}
