import 'package:aggregator/cubits/favourite/favourite_cubit.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/data/models/coords/coords_model.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/data/models/schedule/schedule_model.dart';
import 'package:aggregator/data/models/user/user_model.dart';
import 'package:aggregator/data/repositories/restaurant_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'restaurant_details_state.dart';

class RestaurantDetailsCubit extends Cubit<RestaurantDetailsState> {
  final RestaurantRepository _restaurantRepository;
  final RestaurantCubit _restaurantCubit;
  final FavouriteCubit _favouriteCubit;

  RestaurantDetailsCubit(
    this._restaurantRepository,
    this._restaurantCubit,
    this._favouriteCubit
  ) : super(RestaurantDetailsState.loading());

  Future<void> getRestaurantDetails(int restaurantId) async {
    emit(state.copyWith(restaurantDetailsStatus: RestaurantDetailsStatus.loading));
    try {
      final restaurant = await _restaurantRepository.getRestaurantDetails(restaurantId);
      emit(state.copyWith(restaurant: restaurant, restaurantDetailsStatus: RestaurantDetailsStatus.success));
    } catch (e) {
      emit(state.copyWith(restaurantDetailsStatus: RestaurantDetailsStatus.error));
    }
  }


  Future<void> addToFavourite(Restaurant restaurant) async {
    try {
      await _restaurantRepository.addToFavourite(restaurant.id);
      emit(state.copyWith(restaurant: restaurant.copyWith(isFavourite: !restaurant.isFavourite)));
      await updateScreens();
    } catch (_) {}
  }


  Future<void> deleteLike(Restaurant restaurant) async {
    try {
      await _restaurantRepository.deleteLike(restaurant.id);
      emit(state.copyWith(restaurant: restaurant.copyWith(isFavourite: !restaurant.isFavourite)));
      await updateScreens();
    } catch (_) {}
  }
  

  Future<void> updateScreens() async {
    try {
      await _restaurantCubit.update();
      await _favouriteCubit.update();
    } catch (_) {}
  }
}
