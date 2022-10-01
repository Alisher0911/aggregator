import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/favourite/favourite_cubit.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/presentation/restaurant_details/restaurant_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6)
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            RestaurantDetailsScreen.route(id: widget.restaurant.id, restaurantCubit: context.read<RestaurantCubit>())
          );
        },
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: widget.restaurant.images.isNotEmpty 
                            ? NetworkImage(widget.restaurant.images[0].url) as ImageProvider
                            : const AssetImage("assets/default/restaurant.png"),
                  fit: BoxFit.cover
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 11, 24, 11),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.restaurant.title,
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(fontSize: 13, color: grayColor)
                      ),
                    ),
                    Text(
                      widget.restaurant.coords.addressName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(fontSize: 13, color: grayColor)
                      ),
                    )
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (widget.restaurant.isFavourite) {
                          context.read<RestaurantCubit>().deleteLike(widget.restaurant).then((value) {
                            context.read<FavouriteCubit>().update();
                          });
                          
                        } else {
                          context.read<RestaurantCubit>().addToFavourite(widget.restaurant).then((value) {
                            context.read<FavouriteCubit>().update();
                          }); 
                        }
                      },
                      iconSize: 25,
                      icon: widget.restaurant.isFavourite 
                              ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                              : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}