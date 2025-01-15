import 'package:map_box_app/app/features/map_box/data/models/search_suggestions_model.dart';
import 'package:map_box_app/app/features/map_box/domain/entities/suggestion_entity.dart';

class SuggestMapper {
  SuggestionEntity toSuggest(Suggestion data) {
    try {
      return SuggestionEntity(
        name: data.name ?? 'unknown',
        mapBoxId: data.mapboxId ?? 'unknown',
        fullAddress: data.fullAddress ?? 'unknown',
      );
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
  }

  List<SuggestionEntity> toSuggestList(List<Suggestion> listData) {
    final List<SuggestionEntity> list = [];
    try {
      for (var entity in listData) {
        list.add(toSuggest(entity));
      }
    } catch (e) {
      throw Exception('Failed to mapping data : $e');
    }
    return list;
  }
}
