import 'package:map_box_app/app/features/map_box/data/models/coordinate_model.dart';
import 'package:map_box_app/app/features/map_box/domain/entities/coordinate_entity.dart';

class CoordinateMapper {
  CoordinateEntity toCoordinate(Coordinates data) {
    try {
      return CoordinateEntity(
        lat: data.latitude,
        lon: data.longitude,
      );
    } catch (e) {
      throw Exception("Failed to mapping : $e");
    }
  }
}
