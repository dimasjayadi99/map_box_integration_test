// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuggestionEntity {
  String get name => throw _privateConstructorUsedError;
  String get mapBoxId => throw _privateConstructorUsedError;
  String get fullAddress => throw _privateConstructorUsedError;

  /// Create a copy of SuggestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionEntityCopyWith<SuggestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionEntityCopyWith<$Res> {
  factory $SuggestionEntityCopyWith(
          SuggestionEntity value, $Res Function(SuggestionEntity) then) =
      _$SuggestionEntityCopyWithImpl<$Res, SuggestionEntity>;
  @useResult
  $Res call({String name, String mapBoxId, String fullAddress});
}

/// @nodoc
class _$SuggestionEntityCopyWithImpl<$Res, $Val extends SuggestionEntity>
    implements $SuggestionEntityCopyWith<$Res> {
  _$SuggestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mapBoxId = null,
    Object? fullAddress = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mapBoxId: null == mapBoxId
          ? _value.mapBoxId
          : mapBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionEntityImplCopyWith<$Res>
    implements $SuggestionEntityCopyWith<$Res> {
  factory _$$SuggestionEntityImplCopyWith(_$SuggestionEntityImpl value,
          $Res Function(_$SuggestionEntityImpl) then) =
      __$$SuggestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String mapBoxId, String fullAddress});
}

/// @nodoc
class __$$SuggestionEntityImplCopyWithImpl<$Res>
    extends _$SuggestionEntityCopyWithImpl<$Res, _$SuggestionEntityImpl>
    implements _$$SuggestionEntityImplCopyWith<$Res> {
  __$$SuggestionEntityImplCopyWithImpl(_$SuggestionEntityImpl _value,
      $Res Function(_$SuggestionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? mapBoxId = null,
    Object? fullAddress = null,
  }) {
    return _then(_$SuggestionEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mapBoxId: null == mapBoxId
          ? _value.mapBoxId
          : mapBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestionEntityImpl implements _SuggestionEntity {
  _$SuggestionEntityImpl(
      {required this.name, required this.mapBoxId, required this.fullAddress});

  @override
  final String name;
  @override
  final String mapBoxId;
  @override
  final String fullAddress;

  @override
  String toString() {
    return 'SuggestionEntity(name: $name, mapBoxId: $mapBoxId, fullAddress: $fullAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mapBoxId, mapBoxId) ||
                other.mapBoxId == mapBoxId) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, mapBoxId, fullAddress);

  /// Create a copy of SuggestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionEntityImplCopyWith<_$SuggestionEntityImpl> get copyWith =>
      __$$SuggestionEntityImplCopyWithImpl<_$SuggestionEntityImpl>(
          this, _$identity);
}

abstract class _SuggestionEntity implements SuggestionEntity {
  factory _SuggestionEntity(
      {required final String name,
      required final String mapBoxId,
      required final String fullAddress}) = _$SuggestionEntityImpl;

  @override
  String get name;
  @override
  String get mapBoxId;
  @override
  String get fullAddress;

  /// Create a copy of SuggestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionEntityImplCopyWith<_$SuggestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
