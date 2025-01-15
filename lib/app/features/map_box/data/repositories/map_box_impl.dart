import 'package:map_box_app/app/core/mapper/suggest_mapper.dart';
import 'package:map_box_app/app/features/map_box/data/data_source/map_box_service.dart';
import 'package:map_box_app/app/features/map_box/domain/entities/suggestion_entity.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapBoxImpl extends MapBoxRepository {
  final MapBoxService mapBoxService;
  final SuggestMapper suggestMapper;

  MapBoxImpl({required this.mapBoxService, required this.suggestMapper});

  @override
  Future<List<Position>> fetchRoute(List<Position> coordinates) async {
    try {
      final response = await mapBoxService.fetchRouteService(coordinates);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SuggestionEntity>> searchSuggestion(String query) async {
    try {
      final response = await mapBoxService.fetchSearchSuggestions(query);
      final data = suggestMapper.toSuggestList(response!.suggestions);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
