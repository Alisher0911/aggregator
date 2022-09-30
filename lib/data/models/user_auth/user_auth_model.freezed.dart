// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAuth _$UserAuthFromJson(Map<String, dynamic> json) {
  return _UserAuth.fromJson(json);
}

/// @nodoc
mixin _$UserAuth {
  User get user => throw _privateConstructorUsedError;
  Tokens get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAuthCopyWith<UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthCopyWith<$Res> {
  factory $UserAuthCopyWith(UserAuth value, $Res Function(UserAuth) then) =
      _$UserAuthCopyWithImpl<$Res>;
  $Res call({User user, Tokens tokens});

  $UserCopyWith<$Res> get user;
  $TokensCopyWith<$Res> get tokens;
}

/// @nodoc
class _$UserAuthCopyWithImpl<$Res> implements $UserAuthCopyWith<$Res> {
  _$UserAuthCopyWithImpl(this._value, this._then);

  final UserAuth _value;
  // ignore: unused_field
  final $Res Function(UserAuth) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as Tokens,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $TokensCopyWith<$Res> get tokens {
    return $TokensCopyWith<$Res>(_value.tokens, (value) {
      return _then(_value.copyWith(tokens: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserAuthCopyWith<$Res> implements $UserAuthCopyWith<$Res> {
  factory _$$_UserAuthCopyWith(
          _$_UserAuth value, $Res Function(_$_UserAuth) then) =
      __$$_UserAuthCopyWithImpl<$Res>;
  @override
  $Res call({User user, Tokens tokens});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $TokensCopyWith<$Res> get tokens;
}

/// @nodoc
class __$$_UserAuthCopyWithImpl<$Res> extends _$UserAuthCopyWithImpl<$Res>
    implements _$$_UserAuthCopyWith<$Res> {
  __$$_UserAuthCopyWithImpl(
      _$_UserAuth _value, $Res Function(_$_UserAuth) _then)
      : super(_value, (v) => _then(v as _$_UserAuth));

  @override
  _$_UserAuth get _value => super._value as _$_UserAuth;

  @override
  $Res call({
    Object? user = freezed,
    Object? tokens = freezed,
  }) {
    return _then(_$_UserAuth(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tokens: tokens == freezed
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as Tokens,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAuth implements _UserAuth {
  _$_UserAuth({required this.user, required this.tokens});

  factory _$_UserAuth.fromJson(Map<String, dynamic> json) =>
      _$$_UserAuthFromJson(json);

  @override
  final User user;
  @override
  final Tokens tokens;

  @override
  String toString() {
    return 'UserAuth(user: $user, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAuth &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.tokens, tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(tokens));

  @JsonKey(ignore: true)
  @override
  _$$_UserAuthCopyWith<_$_UserAuth> get copyWith =>
      __$$_UserAuthCopyWithImpl<_$_UserAuth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAuthToJson(
      this,
    );
  }
}

abstract class _UserAuth implements UserAuth {
  factory _UserAuth({required final User user, required final Tokens tokens}) =
      _$_UserAuth;

  factory _UserAuth.fromJson(Map<String, dynamic> json) = _$_UserAuth.fromJson;

  @override
  User get user;
  @override
  Tokens get tokens;
  @override
  @JsonKey(ignore: true)
  _$$_UserAuthCopyWith<_$_UserAuth> get copyWith =>
      throw _privateConstructorUsedError;
}
