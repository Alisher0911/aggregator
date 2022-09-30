import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_model.freezed.dart';
part 'images_model.g.dart';

@freezed
class Images with _$Images {
  factory Images({
    required int id,
    required String url,
    @JsonKey(name: 'restaurant_id') required int restaurantId,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson(json);

}