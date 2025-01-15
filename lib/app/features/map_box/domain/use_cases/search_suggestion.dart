import 'package:map_box_app/app/features/map_box/domain/entities/suggestion_entity.dart';
import 'package:map_box_app/app/features/map_box/domain/repositories/map_box_repository.dart';

class SearchSuggestion {
  final MapBoxRepository mapBoxRepository;
  SearchSuggestion(this.mapBoxRepository);

  Future<List<SuggestionEntity>> searchSuggestion(String query) async {
    return await mapBoxRepository.searchSuggestion(query);
  }
}
