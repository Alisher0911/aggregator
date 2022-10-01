part of 'restaurant_cubit.dart';

enum RestaurantStatus { loading, success, error }

class RestaurantState extends Equatable {
  final List<Restaurant> restaurants;
  final String searchText;
  final List<Restaurant> searchResults;
  final RestaurantStatus restaurantStatus;

  const RestaurantState({
    required this.restaurants,
    required this.searchText,
    required this.searchResults,
    required this.restaurantStatus
  });

  factory RestaurantState.loading() {
    return const RestaurantState(
      restaurants: [],
      searchText: "",
      searchResults: [],
      restaurantStatus: RestaurantStatus.loading
    );
  }

  @override
  List<Object> get props => [restaurants, searchText, searchResults, restaurantStatus];

  RestaurantState copyWith({
    List<Restaurant>? restaurants,
    String? searchText,
    List<Restaurant>? searchResults,
    RestaurantStatus? restaurantStatus,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      searchText: searchText ?? this.searchText,
      searchResults: searchResults ?? this.searchResults,
      restaurantStatus: restaurantStatus ?? this.restaurantStatus,
    );
  }
}
