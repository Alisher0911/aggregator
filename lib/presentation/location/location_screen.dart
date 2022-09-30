import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/geolocation/geolocation_cubit.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/data/models/restaurant/restaurant_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class LocationScreen extends StatelessWidget {

  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Iterable getMarkers(List<Restaurant> restaurants) {
      final markers = [];
      for (var restaurant in restaurants) {
        final marker = Marker(
          rotate: true,
          point: LatLng(restaurant.coords.latitude, restaurant.coords.longitude),
          width: 42,
          height: 48,
          builder: (context) => SvgPicture.asset("assets/geo/marker.svg"),
        );
        markers.add(marker);
      }
      return markers;
    }

    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, restaurantState) {
        if (restaurantState.restaurantStatus == RestaurantStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (restaurantState.restaurantStatus == RestaurantStatus.success) {
          return BlocBuilder<GeolocationCubit, GeolocationState>(
            builder: (context, state) {
              return Scaffold(
                body: Stack(
                  children: [
                    BlocBuilder<GeolocationCubit, GeolocationState>(
                      builder: (context, state) {
                        if (state.geolocationStatus == GeolocationStatus.loading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        else if (state.geolocationStatus == GeolocationStatus.success) {
                          return FlutterMap(
                            options: MapOptions(
                              center: LatLng(state.position.latitude, state.position.longitude),
                              zoom: 16,
                            ),
                            nonRotatedChildren: [
                              Positioned(
                                right: 16,
                                bottom: 16,
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.location,
                                      color: Colors.black,
                                    )
                                  ),
                                ),
                              )
                            ],
                            children: [
                              TileLayer(
                                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(
                                markers: [
                                  Marker(
                                    rotate: true,
                                    point: LatLng(state.position.latitude, state.position.longitude),
                                    width: 40,
                                    height: 40,
                                    builder: (context) => SvgPicture.asset("assets/geo/geolocation.svg"),
                                  ),
                          
                                  ...getMarkers(restaurantState.restaurants)
                                ],
                              ),
                            ],
                          );
                        }
                        else if (state.geolocationStatus == GeolocationStatus.error) {
                          return Center(
                            child: Text(
                              "Произошла ошибка",
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                            ),
                          );
                        }
                        return FlutterMap(options: MapOptions());
                      },
                    ),

                    Positioned(
                      top: 40,
                      left: 16,
                      right: 16,
                      child: TextFormField(
                        style: GoogleFonts.manrope(
                          textStyle: const TextStyle(fontSize: 13, color: Colors.black)
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Поиск",
                          hintStyle: GoogleFonts.manrope(
                            textStyle: TextStyle(fontSize: 13, color: grayColor)
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: grayColor
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(6)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(6)
                          )
                        ),
                      )
                    ),
                  ],
                ),
              );
            },
          );
        } else if (restaurantState.restaurantStatus == RestaurantStatus.error) {
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
      
    );
  }
}