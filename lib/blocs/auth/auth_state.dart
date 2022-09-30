part of 'auth_bloc.dart';

enum AuthStatus { loading, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;

  const AuthState._({
    required this.authStatus
  });

  const AuthState.loading() : this._(
    authStatus: AuthStatus.loading
  );

  const AuthState.authenticated() : this._(
    authStatus: AuthStatus.authenticated
  );

  const AuthState.unauthenticated() : this._(
    authStatus : AuthStatus.unauthenticated
  );
  
  @override
  List<Object> get props => [authStatus];
}
