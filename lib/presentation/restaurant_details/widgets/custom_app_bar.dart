import 'package:aggregator/cubits/restaurant_details/restaurant_details_cubit.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Restaurant restaurant;

  const CustomAppBar({
    super.key,
    required this.restaurant
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent
          ],
          stops: const [0.5, 1]
        )
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(restaurant.title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(
            Icons.arrow_back_ios,
          )
        ),
        actions: [
          IconButton(
            onPressed: () {
              restaurant.isFavourite
                  ? context.read<RestaurantDetailsCubit>().deleteLike(restaurant)
                  : context.read<RestaurantDetailsCubit>().addToFavourite(restaurant);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            iconSize: 30,
            icon: restaurant.isFavourite
                    ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                    : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(125);
}