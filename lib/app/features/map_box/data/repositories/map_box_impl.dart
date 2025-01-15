import 'package:map_box_app/app/features/map_box/data/data_source/map_box_service.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapBoxImpl extends MapBoxRepository {
  final MapBoxService mapBoxService;

  MapBoxImpl({required this.mapBoxService});

  @override
  Future<List<Position>> fetchRoute(List<Position> coordinates) async {
    try {
      final response = await mapBoxService.fetchRouteService(coordinates);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
