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
      attribution: json['attribution'] as String,
    );

Map<String, dynamic> _$SearchSuggestionsModelToJson(
        SearchSuggestionsModel instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
      'attribution': instance.attribution,
    };

Suggestion _$SuggestionFromJson(Map<String, dynamic> json) => Suggestion(
      name: json['name'] as String,
      mapboxId: json['mapbox_id'] as String,
      featureType: json['feature_type'] as String,
      address: json['address'] as String,
      fullAddress: json['full_address'] as String,
      placeFormatted: json['place_formatted'] as String,
      context: Context.fromJson(json['context'] as Map<String, dynamic>),
      language: json['language'] as String,
      maki: json['maki'] as String,
      poiCategory: (json['poi_category'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      poiCategoryIds: (json['poi_category_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      externalIds:
          ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SuggestionToJson(Suggestion instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mapbox_id': instance.mapboxId,
      'feature_type': instance.featureType,
      'address': instance.address,
      'full_address': instance.fullAddress,
      'place_formatted': instance.placeFormatted,
      'context': instance.context,
      'language': instance.language,
      'maki': instance.maki,
      'poi_category': instance.poiCategory,
      'poi_category_ids': instance.poiCategoryIds,
      'external_ids': instance.externalIds,
      'metadata': instance.metadata,
    };

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
      postcode: Neighborhood.fromJson(json['postcode'] as Map<String, dynamic>),
      place: Neighborhood.fromJson(json['place'] as Map<String, dynamic>),
      neighborhood:
          Neighborhood.fromJson(json['neighborhood'] as Map<String, dynamic>),
      street: Neighborhood.fromJson(json['street'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'country': instance.country,
      'region': instance.region,
      'postcode': instance.postcode,
      'place': instance.place,
      'neighborhood': instance.neighborhood,
      'street': instance.street,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      countryCode: json['country_code'] as String,
      countryCodeAlpha3: json['country_code_alpha_3'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'country_code': instance.countryCode,
      'country_code_alpha_3': instance.countryCodeAlpha3,
    };

Neighborhood _$NeighborhoodFromJson(Map<String, dynamic> json) => Neighborhood(
      name: json['name'] as String,
    );

Map<String, dynamic> _$NeighborhoodToJson(Neighborhood instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      name: json['name'] as String,
      regionCode: json['region_code'] as String,
      regionCodeFull: json['region_code_full'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'name': instance.name,
      'region_code': instance.regionCode,
      'region_code_full': instance.regionCodeFull,
    };

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds(
      safegraph: json['safegraph'] as String,
      foursquare: json['foursquare'] as String,
    );

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'safegraph': instance.safegraph,
      'foursquare': instance.foursquare,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata();

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{};
