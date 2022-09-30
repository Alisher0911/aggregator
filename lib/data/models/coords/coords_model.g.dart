// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coords _$$_CoordsFromJson(Map<String, dynamic> json) => _$_Coords(
      id: json['id'] as int,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      addressName: json['address_name'] as String,
    );

Map<String, dynamic> _$$_CoordsToJson(_$_Coords instance) => <String, dynamic>{
      'id': instance.id,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'address_name': instance.addressName,
    };
