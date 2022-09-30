part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}


class LoggedIn extends AuthEvent {
  final Tokens tokens;

  const LoggedIn({required this.tokens});

  @override
  List<Object> get props => [tokens];
}


class LoggedOut extends AuthEvent {}