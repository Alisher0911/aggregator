import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/favourite/favourite_cubit.dart';
import 'package:aggregator/presentation/newsfeed/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatelessWidget {

  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Избранные",
          style: GoogleFonts.manrope(
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
          ),          
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state.favouriteStatus == FavouriteStatus.laoding) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state.favouriteStatus == FavouriteStatus.success) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.favouriteRestaurants.length,
                      itemBuilder: (context, index) {
                        return RestaurantCard(restaurant: state.favouriteRestaurants[index]);
                      }
                    )
                  ],
                ),
              ),
            );
          }
          else if (state.favouriteStatus == FavouriteStatus.error) {
            return Center(
              child: Text(
                "Произошла ошибка",
                style: GoogleFonts.manrope(
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }
          return Container();
        }
      )
    );
  }
}