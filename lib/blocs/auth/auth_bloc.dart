import 'package:aggregator/data/models/tokens/tokens_model.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({ 
    required UserRepository userRepository
  }) : _userRepository = userRepository,
      super(const AuthState.loading()) {
        on<AppStarted>(_onAppStarted);
        on<LoggedIn>(_onLoggedIn);
        on<LoggedOut>(_onLoggedOut);
      }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    final bool hasToken = await _userRepository.hasToken();
    emit(hasToken? const AuthState.authenticated() : const AuthState.unauthenticated());
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    await _userRepository.persistToken(event.tokens);
    emit(const AuthState.authenticated());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await _userRepository.deleteToken();
    emit(const AuthState.unauthenticated());
  }
}
