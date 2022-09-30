part of 'register_cubit.dart';

enum RegisterStatus { initial, submitting, success, error }

class RegisterState extends Equatable {
  final String login;
  final String phone;
  final String email;
  final String password;
  final RegisterStatus registerStatus;

  const RegisterState({
    required this.login,
    required this.phone,
    required this.email,
    required this.password,
    required this.registerStatus
  });

  factory RegisterState.initial() {
    return const RegisterState(
      login: '',
      phone: '',
      email: '',
      password: '',
      registerStatus: RegisterStatus.initial
    );
  }

  @override
  List<Object> get props => [login, phone, email, password, registerStatus];

  RegisterState copyWith({
    String? login,
    String? phone,
    String? email,
    String? password,
    RegisterStatus? registerStatus,
  }) {
    return RegisterState(
      login: login ?? this.login,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}
