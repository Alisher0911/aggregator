import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:aggregator/presentation/newsfeed/widgets/restaurant_card.dart';
import 'package:aggregator/presentation/newsfeed/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsfeedScreen extends StatefulWidget {

  const NewsfeedScreen({super.key});

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}


class _NewsfeedScreenState extends State<NewsfeedScreen> {  
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  final List<Restaurant> _searchResults = [];
  
  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            if (state.restaurantStatus == RestaurantStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } 
            else if (state.restaurantStatus == RestaurantStatus.success) {
              _searchController.addListener(() {
                _onSearchTextChanged(state.restaurants);
              });
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 33, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SearchBox(focusNode: _searchFocusNode, searchController: _searchController),
                    
                      _searchResults.isNotEmpty || _searchController.text.isNotEmpty
                      ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          return RestaurantCard(restaurant: _searchResults[index]);
                        }
                      )
                    
                      : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, index) {
                          return RestaurantCard(restaurant: state.restaurants[index]);
                        }
                      )
                    ],
                  ),
                ),
              );
            }
            else if (state.restaurantStatus == RestaurantStatus.error) {
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
          },
          
        ),
      ),
    );
  }


  _onSearchTextChanged(List<Restaurant> restaurants) {
    _searchResults.clear();
    if (_searchController.text.isEmpty) {
      setState(() {});
      return;
    }

    for (var restaurant in restaurants) {
      if (restaurant.title.toLowerCase().contains(_searchController.text.toLowerCase())) {
        _searchResults.add(restaurant);
      }
    }

    setState(() {});
  }
}