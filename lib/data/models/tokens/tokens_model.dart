import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_model.freezed.dart';
part 'tokens_model.g.dart';

@freezed
class Tokens with _$Tokens {
  factory Tokens({
    required String accessToken,
    required String refreshToken
  }) = _Tokens;

  factory Tokens.fromJson(Map<String, dynamic> json) =>
      _$TokensFromJson(json);
}