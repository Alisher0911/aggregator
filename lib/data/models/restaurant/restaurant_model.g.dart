// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      isFavourite: json['is_favourite'] as bool,
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      coordsId: json['coords_id'] as int,
      userId: json['user_id'] as int,
      schedule: Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      coords: Coords.fromJson(json['coords'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'is_favourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coords_id': instance.coordsId,
      'user_id': instance.userId,
      'schedule': instance.schedule,
      'coords': instance.coords,
      'images': instance.images,
      'user': instance.user,
    };
