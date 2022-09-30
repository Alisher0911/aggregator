import 'package:aggregator/data/models/tokens/tokens_model.dart';
import 'package:aggregator/data/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_model.freezed.dart';
part 'user_auth_model.g.dart';

@freezed
class UserAuth with _$UserAuth {
  factory UserAuth({
    required User user,
    required Tokens tokens
  }) = _UserAuth;

  factory UserAuth.fromJson(Map<String, dynamic> json) =>
      _$UserAuthFromJson(json);
}