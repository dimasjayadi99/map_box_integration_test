import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class FetchRoute {
  final MapBoxRepository mapBoxRepository;
  FetchRoute(this.mapBoxRepository);

  Future<List<Position>> fetchRoute(List<Position> coordinates) async {
    return await mapBoxRepository.fetchRoute(coordinates);
  }
}
