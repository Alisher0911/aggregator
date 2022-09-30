import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_model.freezed.dart';
part 'like_model.g.dart';

@freezed
class Like with _$Like {
  factory Like({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'restaurant_id') required int restaurantId,
    required int id,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) =>
      _$LikeFromJson(json);
}