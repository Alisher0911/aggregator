// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  @JsonKey(name: 'is_favourite')
  bool get isFavourite => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'coords_id')
  int get coordsId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  Schedule get schedule => throw _privateConstructorUsedError;
  Coords get coords => throw _privateConstructorUsedError;
  List<Images> get images => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'is_favourite') bool isFavourite,
      int id,
      String title,
      String description,
      @JsonKey(name: 'coords_id') int coordsId,
      @JsonKey(name: 'user_id') int userId,
      Schedule schedule,
      Coords coords,
      List<Images> images,
      User user});

  $ScheduleCopyWith<$Res> get schedule;
  $CoordsCopyWith<$Res> get coords;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object? isFavourite = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? coordsId = freezed,
    Object? userId = freezed,
    Object? schedule = freezed,
    Object? coords = freezed,
    Object? images = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coordsId: coordsId == freezed
          ? _value.coordsId
          : coordsId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as Coords,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  @override
  $CoordsCopyWith<$Res> get coords {
    return $CoordsCopyWith<$Res>(_value.coords, (value) {
      return _then(_value.copyWith(coords: value));
    });
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_RestaurantCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$_RestaurantCopyWith(
          _$_Restaurant value, $Res Function(_$_Restaurant) then) =
      __$$_RestaurantCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'is_favourite') bool isFavourite,
      int id,
      String title,
      String description,
      @JsonKey(name: 'coords_id') int coordsId,
      @JsonKey(name: 'user_id') int userId,
      Schedule schedule,
      Coords coords,
      List<Images> images,
      User user});

  @override
  $ScheduleCopyWith<$Res> get schedule;
  @override
  $CoordsCopyWith<$Res> get coords;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$$_RestaurantCopyWith<$Res> {
  __$$_RestaurantCopyWithImpl(
      _$_Restaurant _value, $Res Function(_$_Restaurant) _then)
      : super(_value, (v) => _then(v as _$_Restaurant));

  @override
  _$_Restaurant get _value => super._value as _$_Restaurant;

  @override
  $Res call({
    Object? isFavourite = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? coordsId = freezed,
    Object? userId = freezed,
    Object? schedule = freezed,
    Object? coords = freezed,
    Object? images = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_Restaurant(
      isFavourite: isFavourite == freezed
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coordsId: coordsId == freezed
          ? _value.coordsId
          : coordsId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      schedule: schedule == freezed
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      coords: coords == freezed
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as Coords,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Restaurant implements _Restaurant {
  _$_Restaurant(
      {@JsonKey(name: 'is_favourite') required this.isFavourite,
      required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'coords_id') required this.coordsId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.schedule,
      required this.coords,
      required final List<Images> images,
      required this.user})
      : _images = images;

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantFromJson(json);

  @override
  @JsonKey(name: 'is_favourite')
  final bool isFavourite;
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'coords_id')
  final int coordsId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final Schedule schedule;
  @override
  final Coords coords;
  final List<Images> _images;
  @override
  List<Images> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final User user;

  @override
  String toString() {
    return 'Restaurant(isFavourite: $isFavourite, id: $id, title: $title, description: $description, coordsId: $coordsId, userId: $userId, schedule: $schedule, coords: $coords, images: $images, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Restaurant &&
            const DeepCollectionEquality()
                .equals(other.isFavourite, isFavourite) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.coordsId, coordsId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.schedule, schedule) &&
            const DeepCollectionEquality().equals(other.coords, coords) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isFavourite),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(coordsId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(schedule),
      const DeepCollectionEquality().hash(coords),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_RestaurantCopyWith<_$_Restaurant> get copyWith =>
      __$$_RestaurantCopyWithImpl<_$_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {@JsonKey(name: 'is_favourite') required final bool isFavourite,
      required final int id,
      required final String title,
      required final String description,
      @JsonKey(name: 'coords_id') required final int coordsId,
      @JsonKey(name: 'user_id') required final int userId,
      required final Schedule schedule,
      required final Coords coords,
      required final List<Images> images,
      required final User user}) = _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  @JsonKey(name: 'is_favourite')
  bool get isFavourite;
  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'coords_id')
  int get coordsId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  Schedule get schedule;
  @override
  Coords get coords;
  @override
  List<Images> get images;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantCopyWith<_$_Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}
