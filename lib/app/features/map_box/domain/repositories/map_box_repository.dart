import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

abstract class MapBoxRepository {
  Future<List<Position>> fetchRoute(List<Position> coordinates);
}
