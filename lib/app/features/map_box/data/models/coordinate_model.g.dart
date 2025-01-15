// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateModel _$CoordinateModelFromJson(Map<String, dynamic> json) =>
    CoordinateModel(
      features: (json['features'] as List<dynamic>)
          .map((e) => Feature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoordinateModelToJson(CoordinateModel instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      properties:
          Properties.fromJson(json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'properties': instance.properties,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
