// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAuth _$$_UserAuthFromJson(Map<String, dynamic> json) => _$_UserAuth(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserAuthToJson(_$_UserAuth instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };
