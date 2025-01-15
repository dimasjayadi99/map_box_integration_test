// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestionsModel _$SearchSuggestionsModelFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestionsModel(
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchSuggestionsModelToJson(
        SearchSuggestionsModel instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
    };

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) => Suggestion(
      name: json['name'] as String?,
      mapboxId: json['mapbox_id'] as String?,
      featureType: json['feature_type'] as String?,
      address: json['address'] as String?,
      fullAddress: json['full_address'] as String?,
      placeFormatted: json['place_formatted'] as String?,
    );

Map<String, dynamic> _$SuggestionToJson(Suggestion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mapbox_id': instance.mapboxId,
      'feature_type': instance.featureType,
      'address': instance.address,
      'full_address': instance.fullAddress,
      'place_formatted': instance.placeFormatted,
    };
