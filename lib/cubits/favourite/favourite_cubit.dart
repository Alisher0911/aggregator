import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/data/repositories/restaurant_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final RestaurantRepository _restaurantRepository;

  FavouriteCubit(this._restaurantRepository) : super(FavouriteState.loading());

  Future<void> getFavouriteRestaurants() async {
    emit(state.copyWith(favouriteStatus: FavouriteStatus.laoding));
    try {
      final restaurants = await _restaurantRepository.getFavouriteRestaurants();
      emit(state.copyWith(favouriteRestaurants: restaurants, favouriteStatus: FavouriteStatus.success));
    } catch (e) {
      emit(state.copyWith(favouriteStatus: FavouriteStatus.error));
    }
  }


  Future<void> update() async {
    try {
      final restaurants = await _restaurantRepository.getFavouriteRestaurants();
      emit(state.copyWith(favouriteRestaurants: restaurants));
    } catch (_) {}
  }
}
