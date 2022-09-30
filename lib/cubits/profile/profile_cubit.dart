import 'package:aggregator/data/models/user/user_model.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepository _userRepository;

  ProfileCubit(this._userRepository) : super(ProfileState.loading());

  Future<void> getUserProfile() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    try {
      final user = await _userRepository.getUserProfile();
      emit(state.copyWith(user: user, profileStatus: ProfileStatus.success));
    } catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.error));
    }
  }
}
