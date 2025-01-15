import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_entity.freezed.dart';

@freezed
class SuggestionEntity with _$SuggestionEntity {
  factory SuggestionEntity({
    required String name,
    required String mapBoxId,
    required String fullAddress,
  }) = _SuggestionEntity;
}
