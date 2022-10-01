import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/data/repositories/restaurant_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository _restaurantRepository;

  RestaurantCubit(
    this._restaurantRepository,
  ) : super(RestaurantState.loading());

  Future<void> getAllRestaurants() async {
    emit(state.copyWith(restaurantStatus: RestaurantStatus.loading));
    try {
      final restaurants = await _restaurantRepository.getAllRestaurants();
      emit(state.copyWith(restaurants: restaurants, restaurantStatus: RestaurantStatus.success));
    } catch (e) {
      emit(state.copyWith(restaurantStatus: RestaurantStatus.error));
    }
  }

  void getSearchResults(String searchText) {
    if (searchText == "") {
      emit(state.copyWith(searchResults: []));
      return;
    }

    emit(state.copyWith(searchText: searchText));

    final searchResults = state.restaurants.where(
      (restaurant) => restaurant.title.toLowerCase().contains(state.searchText.toLowerCase())
    ).toList();

    emit(state.copyWith(searchResults: searchResults));
  }

  Future<void> addToFavourite(Restaurant restaurant) async {
    try {
      await _restaurantRepository.addToFavourite(restaurant.id);
      final updatedList = state.restaurants.map(
          (r) => r.id == restaurant.id ? r.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      final updatedSearchList = state.searchResults.map(
          (r) => r.id == restaurant.id ? r.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      emit(state.copyWith(
        restaurants: updatedList,
        searchResults: updatedSearchList
      ));
    } catch (_) {}
  }


  Future<void> deleteLike(Restaurant restaurant) async {
    try {
      await _restaurantRepository.deleteLike(restaurant.id);
      final updatedList = state.restaurants.map(
          (r) => r.id == restaurant.id ? restaurant.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      final updatedSearchList = state.searchResults.map(
          (r) => r.id == restaurant.id ? r.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      emit(state.copyWith(
        restaurants: updatedList,
        searchResults: updatedSearchList
      ));
    } catch (_) {}
  }


  Future<void> update() async {
    try {
      final restaurants = await _restaurantRepository.getAllRestaurants();
      final searchResults = restaurants.where(
        (restaurant) => restaurant.title.toLowerCase().contains(state.searchText.toLowerCase())
      ).toList();
      emit(state.copyWith(restaurants: restaurants, searchResults: searchResults));
    } catch (_) {}
  }
}
