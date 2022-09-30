import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  LoginCubit(this._userRepository, this._authBloc) : super(LoginState.initial());

  Future<void> login(String email, String password) async {
    if (state.loginStatus == LoginStatus.submitting) return;
    emit(state.copyWith(loginStatus: LoginStatus.submitting));
    try {
      final userAuth = await _userRepository.login(email, password);
      _authBloc.add(LoggedIn(tokens: userAuth.tokens));
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }
}
