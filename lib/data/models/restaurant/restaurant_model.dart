import 'package:aggregator/data/models/coords/coords_model.dart';
import 'package:aggregator/data/models/images/images_model.dart';
import 'package:aggregator/data/models/schedule/schedule_model.dart';
import 'package:aggregator/data/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class Restaurant with _$Restaurant{
  factory Restaurant({
    @JsonKey(name: 'is_favourite') required bool isFavourite, 
    required int id, 
    required String title, 
    required String description,
    @JsonKey(name: 'coords_id') required int coordsId, 
    @JsonKey(name: 'user_id') required int userId, 
    required Schedule schedule,
    required Coords coords, 
    required List<Images> images,
    required User user
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}