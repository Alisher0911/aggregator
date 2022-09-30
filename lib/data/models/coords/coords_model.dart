import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords_model.freezed.dart';
part 'coords_model.g.dart';

@freezed
class Coords with _$Coords {
  factory Coords({
    required int id,
    required double longitude,
    required double latitude,
    @JsonKey(name: 'address_name') required String addressName
  }) = _Coords;

  factory Coords.fromJson(Map<String, dynamic> json) =>
      _$CoordsFromJson(json);
}