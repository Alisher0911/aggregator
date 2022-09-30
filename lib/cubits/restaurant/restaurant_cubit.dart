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


  Future<void> addToFavourite(Restaurant restaurant) async {
    try {
      await _restaurantRepository.addToFavourite(restaurant.id);
      final updatedList = state.restaurants.map(
          (r) => r.id == restaurant.id ? r.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      emit(state.copyWith(
        restaurants: updatedList
      ));
    } catch (_) {}
  }


  Future<void> deleteLike(Restaurant restaurant) async {
    try {
      await _restaurantRepository.deleteLike(restaurant.id);
      final updatedList = state.restaurants.map(
          (r) => r.id == restaurant.id ? restaurant.copyWith(isFavourite: !restaurant.isFavourite) : r
        ).toList();
      emit(state.copyWith(
        restaurants: updatedList
      ));
    } catch (_) {}
  }


  Future<void> update() async {
    try {
      final restaurants = await _restaurantRepository.getAllRestaurants();
      emit(state.copyWith(restaurants: restaurants));
    } catch (_) {}
  }
}
