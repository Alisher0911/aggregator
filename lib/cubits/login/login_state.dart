part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus loginStatus;

  const LoginState({
    required this.email,
    required this.password,
    required this.loginStatus
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      loginStatus: LoginStatus.initial
    );
  }

  @override
  List<Object> get props => [email, password, loginStatus];

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
