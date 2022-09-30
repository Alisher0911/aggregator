part of 'favourite_cubit.dart';

enum FavouriteStatus { laoding, success, error }

class FavouriteState extends Equatable {
  final List<Restaurant> favouriteRestaurants;
  final FavouriteStatus favouriteStatus;

  const FavouriteState({
    required this.favouriteRestaurants,
    required this.favouriteStatus
  });

  factory FavouriteState.loading() {
    return const FavouriteState(
      favouriteRestaurants: [],
      favouriteStatus: FavouriteStatus.laoding
    );
  }

  @override
  List<Object> get props => [favouriteRestaurants, favouriteStatus];


  FavouriteState copyWith({
    List<Restaurant>? favouriteRestaurants,
    FavouriteStatus? favouriteStatus,
  }) {
    return FavouriteState(
      favouriteRestaurants: favouriteRestaurants ?? this.favouriteRestaurants,
      favouriteStatus: favouriteStatus ?? this.favouriteStatus,
    );
  }
}
