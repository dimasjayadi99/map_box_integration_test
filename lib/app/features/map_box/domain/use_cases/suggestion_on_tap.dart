import 'package:map_box_app/app/features/map_box/domain/entities/coordinate_entity.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';

class SuggestionOnTap {
  final MapBoxRepository mapBoxRepository;

  SuggestionOnTap(this.mapBoxRepository);

  Future<CoordinateEntity> suggestionOnTap(String id) async {
    return await mapBoxRepository.suggestionOnTap(id);
  }
}
