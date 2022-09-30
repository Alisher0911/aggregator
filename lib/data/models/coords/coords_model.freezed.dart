// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coords_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Coords _$CoordsFromJson(Map<String, dynamic> json) {
  return _Coords.fromJson(json);
}

/// @nodoc
mixin _$Coords {
  int get id => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_name')
  String get addressName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoordsCopyWith<Coords> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordsCopyWith<$Res> {
  factory $CoordsCopyWith(Coords value, $Res Function(Coords) then) =
      _$CoordsCopyWithImpl<$Res>;
  $Res call(
      {int id,
      double longitude,
      double latitude,
      @JsonKey(name: 'address_name') String addressName});
}

/// @nodoc
class _$CoordsCopyWithImpl<$Res> implements $CoordsCopyWith<$Res> {
  _$CoordsCopyWithImpl(this._value, this._then);

  final Coords _value;
  // ignore: unused_field
  final $Res Function(Coords) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? addressName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CoordsCopyWith<$Res> implements $CoordsCopyWith<$Res> {
  factory _$$_CoordsCopyWith(_$_Coords value, $Res Function(_$_Coords) then) =
      __$$_CoordsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      double longitude,
      double latitude,
      @JsonKey(name: 'address_name') String addressName});
}

/// @nodoc
class __$$_CoordsCopyWithImpl<$Res> extends _$CoordsCopyWithImpl<$Res>
    implements _$$_CoordsCopyWith<$Res> {
  __$$_CoordsCopyWithImpl(_$_Coords _value, $Res Function(_$_Coords) _then)
      : super(_value, (v) => _then(v as _$_Coords));

  @override
  _$_Coords get _value => super._value as _$_Coords;

  @override
  $Res call({
    Object? id = freezed,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? addressName = freezed,
  }) {
    return _then(_$_Coords(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      addressName: addressName == freezed
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Coords implements _Coords {
  _$_Coords(
      {required this.id,
      required this.longitude,
      required this.latitude,
      @JsonKey(name: 'address_name') required this.addressName});

  factory _$_Coords.fromJson(Map<String, dynamic> json) =>
      _$$_CoordsFromJson(json);

  @override
  final int id;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  @JsonKey(name: 'address_name')
  final String addressName;

  @override
  String toString() {
    return 'Coords(id: $id, longitude: $longitude, latitude: $latitude, addressName: $addressName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Coords &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality()
                .equals(other.addressName, addressName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(addressName));

  @JsonKey(ignore: true)
  @override
  _$$_CoordsCopyWith<_$_Coords> get copyWith =>
      __$$_CoordsCopyWithImpl<_$_Coords>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoordsToJson(
      this,
    );
  }
}

abstract class _Coords implements Coords {
  factory _Coords(
          {required final int id,
          required final double longitude,
          required final double latitude,
          @JsonKey(name: 'address_name') required final String addressName}) =
      _$_Coords;

  factory _Coords.fromJson(Map<String, dynamic> json) = _$_Coords.fromJson;

  @override
  int get id;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(name: 'address_name')
  String get addressName;
  @override
  @JsonKey(ignore: true)
  _$$_CoordsCopyWith<_$_Coords> get copyWith =>
      throw _privateConstructorUsedError;
}
