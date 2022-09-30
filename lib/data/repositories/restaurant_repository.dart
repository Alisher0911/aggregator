import 'package:aggregator/data/models/like/like_model.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/data/services/api_client.dart';

class RestaurantRepository { 

  final _apiClient = ApiClient();

  Future<List<Restaurant>> getAllRestaurants() async {
    final response = await _apiClient.api.get("/restaurants/all");
    if (response.statusCode == 200) {
      return (response.data['restaurants'] as List)
          .map((x) => Restaurant.fromJson(x))
          .toList();
    } else {
      throw Exception("Failed to load restaurants");
    }
  }

  
  Future<Restaurant> getRestaurantDetails(int restaurantId) async {
    final response = await _apiClient.api.get("/restaurants/details/$restaurantId");
    if (response.statusCode == 200) {
      return Restaurant.fromJson(response.data["restaurant"][0]);
    } else {
      throw Exception("Failed to load restaurant details");
    }
  }


  Future<List<Restaurant>> getFavouriteRestaurants() async {
    final response = await _apiClient.api.get("/likes/all");
    if (response.statusCode == 200) {
      return (response.data['restaurants'] as List)
          .map((x) => Restaurant.fromJson(x))
          .toList();
    } else {
      throw Exception("Failed to load favourite restaurants");
    }
  }


  Future<Like> addToFavourite(int restaurantId) async {
    final response = await _apiClient.api.post("/likes/new", data: {
      "restaurant_id" : restaurantId
    });
    if (response.statusCode == 200) {
      return Like.fromJson(response.data['like']);
    } else {
      throw Exception("Failed to add to favourite");
    }
  }


  Future<void> deleteLike(int restaurantId) async {
    await _apiClient.api.delete("/likes/$restaurantId");
  }
}