import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/data/repositories/user_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  RegisterCubit(this._userRepository, this._authBloc) : super(RegisterState.initial());

  Future<void> register(String email, String nickname, String phone, String password) async {
    if (state.registerStatus == RegisterStatus.submitting) return;
    emit(state.copyWith(registerStatus: RegisterStatus.submitting));
    try {
      final userAuth = await _userRepository.register(email, nickname, phone, password);
      _authBloc.add(LoggedIn(tokens: userAuth.tokens));
      emit(state.copyWith(registerStatus: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(registerStatus: RegisterStatus.error));
    }
  }
}
