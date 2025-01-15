// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinate_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoordinateEntity {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  /// Create a copy of CoordinateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinateEntityCopyWith<CoordinateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateEntityCopyWith<$Res> {
  factory $CoordinateEntityCopyWith(
          CoordinateEntity value, $Res Function(CoordinateEntity) then) =
      _$CoordinateEntityCopyWithImpl<$Res, CoordinateEntity>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$CoordinateEntityCopyWithImpl<$Res, $Val extends CoordinateEntity>
    implements $CoordinateEntityCopyWith<$Res> {
  _$CoordinateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinateEntityImplCopyWith<$Res>
    implements $CoordinateEntityCopyWith<$Res> {
  factory _$$CoordinateEntityImplCopyWith(_$CoordinateEntityImpl value,
          $Res Function(_$CoordinateEntityImpl) then) =
      __$$CoordinateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$CoordinateEntityImplCopyWithImpl<$Res>
    extends _$CoordinateEntityCopyWithImpl<$Res, _$CoordinateEntityImpl>
    implements _$$CoordinateEntityImplCopyWith<$Res> {
  __$$CoordinateEntityImplCopyWithImpl(_$CoordinateEntityImpl _value,
      $Res Function(_$CoordinateEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordinateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$CoordinateEntityImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CoordinateEntityImpl implements _CoordinateEntity {
  _$CoordinateEntityImpl({required this.lat, required this.lon});

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'CoordinateEntity(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinateEntityImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  /// Create a copy of CoordinateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinateEntityImplCopyWith<_$CoordinateEntityImpl> get copyWith =>
      __$$CoordinateEntityImplCopyWithImpl<_$CoordinateEntityImpl>(
          this, _$identity);
}

abstract class _CoordinateEntity implements CoordinateEntity {
  factory _CoordinateEntity(
      {required final double lat,
      required final double lon}) = _$CoordinateEntityImpl;

  @override
  double get lat;
  @override
  double get lon;

  /// Create a copy of CoordinateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinateEntityImplCopyWith<_$CoordinateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
