part of 'restaurant_details_cubit.dart';

enum RestaurantDetailsStatus { loading, success, error }

class RestaurantDetailsState extends Equatable {
  final Restaurant restaurant;
  final RestaurantDetailsStatus restaurantDetailsStatus;

  const RestaurantDetailsState({
    required this.restaurant,
    required this.restaurantDetailsStatus
  });

  factory RestaurantDetailsState.loading() {
    return RestaurantDetailsState(
      restaurant: Restaurant(isFavourite: false, id: 0, title: '', description: "", coordsId: 0, userId: 0, schedule: Schedule(id: 0, opening: "", closing: ""), coords: Coords(id: 0, longitude: 0, latitude: 0, addressName: ""), images: [], user: User(id: 0, email: '', nickname: '')),
      restaurantDetailsStatus: RestaurantDetailsStatus.loading
    );
  }

  @override
  List<Object> get props => [restaurant, restaurantDetailsStatus];

  RestaurantDetailsState copyWith({
    Restaurant? restaurant,
    RestaurantDetailsStatus? restaurantDetailsStatus,
  }) {
    return RestaurantDetailsState(
      restaurant: restaurant ?? this.restaurant,
      restaurantDetailsStatus: restaurantDetailsStatus ?? this.restaurantDetailsStatus,
    );
  }
}
