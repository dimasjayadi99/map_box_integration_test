import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinate_entity.freezed.dart';

@freezed
class CoordinateEntity with _$CoordinateEntity {
  factory CoordinateEntity({required double lat, required double lon}) =
      _CoordinateEntity;
}
