part of 'profile_cubit.dart';

enum ProfileStatus { loading, success, error }

class ProfileState extends Equatable {
  final User user;
  final ProfileStatus profileStatus;

  const ProfileState({
    required this.user,
    required this.profileStatus
  });

  factory ProfileState.loading() {
    return ProfileState(
      user: User(id: 0, email: "", nickname: ""),
      profileStatus: ProfileStatus.loading
    );
  }

  @override
  List<Object> get props => [user, profileStatus];

  ProfileState copyWith({
    User? user,
    ProfileStatus? profileStatus,
  }) {
    return ProfileState(
      user: user ?? this.user,
      profileStatus: profileStatus ?? this.profileStatus,
    );
  }
}
