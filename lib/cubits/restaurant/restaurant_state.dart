part of 'restaurant_cubit.dart';

enum RestaurantStatus { loading, success, error }

class RestaurantState extends Equatable {
  final List<Restaurant> restaurants;
  final RestaurantStatus restaurantStatus;

  const RestaurantState({
    required this.restaurants,
    required this.restaurantStatus
  });

  factory RestaurantState.loading() {
    return const RestaurantState(
      restaurants: [],
      restaurantStatus: RestaurantStatus.loading
    );
  }

  @override
  List<Object> get props => [restaurants, restaurantStatus];

  RestaurantState copyWith({
    List<Restaurant>? restaurants,
    RestaurantStatus? restaurantStatus,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      restaurantStatus: restaurantStatus ?? this.restaurantStatus,
    );
  }
}
