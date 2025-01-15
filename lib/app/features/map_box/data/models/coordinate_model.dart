import 'package:json_annotation/json_annotation.dart';

part 'coordinate_model.g.dart';

@JsonSerializable()
class CoordinateModel {
  @JsonKey(name: "features")
  final List<Feature> features;

  CoordinateModel({
    required this.features,
  });

  factory CoordinateModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateModelToJson(this);
}

@JsonSerializable()
class Feature {
  @JsonKey(name: "properties")
  final Properties properties;

  Feature({
    required this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: "coordinates")
  final Coordinates coordinates;

  Properties({
    required this.coordinates,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class Coordinates {
  @JsonKey(name: "latitude")
  final double latitude;
  @JsonKey(name: "longitude")
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
