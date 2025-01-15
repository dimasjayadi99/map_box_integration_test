import 'package:json_annotation/json_annotation.dart';

part 'search_suggestions_model.g.dart';

@JsonSerializable()
class SearchSuggestionsModel {
  @JsonKey(name: "suggestions")
  final List<Suggestion> suggestions;

  SearchSuggestionsModel({
    required this.suggestions,
  });

  factory SearchSuggestionsModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionsModelToJson(this);
}

@JsonSerializable()
class Suggestion {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "mapbox_id")
  final String? mapboxId;
  @JsonKey(name: "feature_type")
  final String? featureType;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "full_address")
  final String? fullAddress;
  @JsonKey(name: "place_formatted")
  final String? placeFormatted;

  Suggestion({
    required this.name,
    required this.mapboxId,
    required this.featureType,
    required this.address,
    required this.fullAddress,
    required this.placeFormatted,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}
