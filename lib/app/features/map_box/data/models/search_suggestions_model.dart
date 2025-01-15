import 'package:json_annotation/json_annotation.dart';

part 'search_suggestions_model.g.dart';

@JsonSerializable()
class SearchSuggestionsModel {
  @JsonKey(name: "suggestions")
  final List<Suggestion> suggestions;
  @JsonKey(name: "attribution")
  final String attribution;

  SearchSuggestionsModel({
    required this.suggestions,
    required this.attribution,
  });

  factory SearchSuggestionsModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionsModelToJson(this);
}

@JsonSerializable()
class Suggestion {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "mapbox_id")
  final String mapboxId;
  @JsonKey(name: "feature_type")
  final String featureType;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "full_address")
  final String fullAddress;
  @JsonKey(name: "place_formatted")
  final String placeFormatted;
  @JsonKey(name: "context")
  final Context context;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "maki")
  final String maki;
  @JsonKey(name: "poi_category")
  final List<String> poiCategory;
  @JsonKey(name: "poi_category_ids")
  final List<String> poiCategoryIds;
  @JsonKey(name: "external_ids")
  final ExternalIds externalIds;
  @JsonKey(name: "metadata")
  final Metadata metadata;

  Suggestion({
    required this.name,
    required this.mapboxId,
    required this.featureType,
    required this.address,
    required this.fullAddress,
    required this.placeFormatted,
    required this.context,
    required this.language,
    required this.maki,
    required this.poiCategory,
    required this.poiCategoryIds,
    required this.externalIds,
    required this.metadata,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) =>
      _$SuggestionFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionToJson(this);
}

@JsonSerializable()
class Context {
  @JsonKey(name: "country")
  final Country country;
  @JsonKey(name: "region")
  final Region region;
  @JsonKey(name: "postcode")
  final Neighborhood postcode;
  @JsonKey(name: "place")
  final Neighborhood place;
  @JsonKey(name: "neighborhood")
  final Neighborhood neighborhood;
  @JsonKey(name: "street")
  final Neighborhood street;

  Context({
    required this.country,
    required this.region,
    required this.postcode,
    required this.place,
    required this.neighborhood,
    required this.street,
  });

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  Map<String, dynamic> toJson() => _$ContextToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "country_code")
  final String countryCode;
  @JsonKey(name: "country_code_alpha_3")
  final String countryCodeAlpha3;

  Country({
    required this.name,
    required this.countryCode,
    required this.countryCodeAlpha3,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Neighborhood {
  @JsonKey(name: "name")
  final String name;

  Neighborhood({
    required this.name,
  });

  factory Neighborhood.fromJson(Map<String, dynamic> json) =>
      _$NeighborhoodFromJson(json);

  Map<String, dynamic> toJson() => _$NeighborhoodToJson(this);
}

@JsonSerializable()
class Region {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "region_code")
  final String regionCode;
  @JsonKey(name: "region_code_full")
  final String regionCodeFull;

  Region({
    required this.name,
    required this.regionCode,
    required this.regionCodeFull,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class ExternalIds {
  @JsonKey(name: "safegraph")
  final String safegraph;
  @JsonKey(name: "foursquare")
  final String foursquare;

  ExternalIds({
    required this.safegraph,
    required this.foursquare,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalIdsToJson(this);
}

@JsonSerializable()
class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
