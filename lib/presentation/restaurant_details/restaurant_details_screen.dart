import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/favourite/favourite_cubit.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/cubits/restaurant_details/restaurant_details_cubit.dart';
import 'package:aggregator/presentation/restaurant_details/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/repositories/restaurant_repository.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  final int id;
  final RestaurantCubit restaurantCubit;
  static const String routeName = '/restaurant-details';

  static Route route({required int id, required RestaurantCubit restaurantCubit}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantDetailsScreen(id: id, restaurantCubit: restaurantCubit),
        settings: const RouteSettings(name: routeName));
  }

  const RestaurantDetailsScreen({
    super.key,
    required this.id,
    required this.restaurantCubit
  });

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}


class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  bool _isFullText = false;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RestaurantDetailsCubit(context.read<RestaurantRepository>(), context.read<RestaurantCubit>(), context.read<FavouriteCubit>())..getRestaurantDetails(widget.id)),
      ],
      child: BlocBuilder<RestaurantDetailsCubit, RestaurantDetailsState>(
        builder: (context, state) {
          if (state.restaurantDetailsStatus == RestaurantDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state.restaurantDetailsStatus == RestaurantDetailsStatus.success) {
    
            return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(restaurant: state.restaurant),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: state.restaurant.images.isNotEmpty 
                            ? NetworkImage(state.restaurant.images[0].url) as ImageProvider
                            : const AssetImage("assets/default/restaurant.png"),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
              
                    
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Описание",
                            style: GoogleFonts.manrope(
                              textStyle: TextStyle(fontSize: 13, color: grayColor)
                            ),
                          ),
              
                          const SizedBox(height: 3),
    
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final span = TextSpan(
                                text: state.restaurant.description,
                                style: GoogleFonts.manrope(
                                  textStyle: const TextStyle(fontSize: 16, color: Colors.black)
                                ),
                              );
                              final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
                              tp.layout(maxWidth: constraints.maxWidth);
                              final numLines = tp.computeLineMetrics().length;
                              if (numLines > 2) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildDescription(state.restaurant.description),
                                    
                                    const SizedBox(height: 5),
    
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isFullText = !_isFullText;
                                        });
                                      },
                                      child: Text(
                                        _isFullText?  "Скрыть" : "Подробнее",
                                        style: GoogleFonts.manrope(
                                          textStyle: TextStyle(fontSize: 13, color: purpleColor, decoration: TextDecoration.underline)
                                        ),
                                      )
                                    ),
                                  ],
                                );
                              } else {
                                return _buildDescription(state.restaurant.description);
                              }
                            }
                          )
                        ],
                      ),
                    ),
              
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE0E6ED)
                    ),
              
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                            minLeadingWidth : 10,
                            title: Text(
                              "Работаем с ${state.restaurant.schedule.opening} до ${state.restaurant.schedule.closing}",
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(fontSize: 16)
                              ),
                            ),
                            leading: const Icon(
                              Icons.access_time,
                              color: Colors.black,
                            ),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
                            minLeadingWidth : 10,
                            title: Text(
                              state.restaurant.coords.addressName,
                              style: GoogleFonts.manrope(
                                textStyle: const TextStyle(fontSize: 16)
                              ),
                            ),
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
              
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE0E6ED),
                    ),
                  ],
                ),
              ),
            );
          }
          else if (state.restaurantDetailsStatus == RestaurantDetailsStatus.error) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Информация",
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
                  ),          
                ),
                centerTitle: true,
                backgroundColor: whiteColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )
                ),
              ),
              body: Center(
                child: Text(
                  "Произошла ошибка",
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }
          return Container();
        }
      ),
    );
  }

  Widget _buildDescription(String description) {
    final maxLines = _isFullText ? null : 2;
    final overflow = _isFullText? TextOverflow.visible : TextOverflow.ellipsis;

    return Text(
      description,
      style: GoogleFonts.manrope(
        textStyle: const TextStyle(fontSize: 16, color: Colors.black)
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}