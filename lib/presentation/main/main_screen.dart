import 'package:aggregator/consts/tab_item.dart';
import 'package:aggregator/cubits/favourite/favourite_cubit.dart';
import 'package:aggregator/cubits/geolocation/geolocation_cubit.dart';
import 'package:aggregator/cubits/profile/profile_cubit.dart';
import 'package:aggregator/cubits/restaurant/restaurant_cubit.dart';
import 'package:aggregator/data/repositories/geolocation_repository.dart';
import 'package:aggregator/data/repositories/restaurant_repository.dart';
import 'package:aggregator/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bottom_navigation.dart';
import 'widgets/tab_navigator.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const MainScreen(),
        settings: const RouteSettings(name: routeName));
  }

  static Page<void> page() => const MaterialPage<void>(child: MainScreen());

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  
  TabItem currentTab = TabItem.newsfeed;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.newsfeed: GlobalKey<NavigatorState>(),
    TabItem.location: GlobalKey<NavigatorState>(),
    TabItem.favourite: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKeys[currentTab]!.currentState!.maybePop(),
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => RestaurantCubit(context.read<RestaurantRepository>())..getAllRestaurants()),
            BlocProvider(create: (context) => ProfileCubit(context.read<UserRepository>())..getUserProfile()),
            BlocProvider(create: (context) => FavouriteCubit(context.read<RestaurantRepository>())..getFavouriteRestaurants()),
            BlocProvider(create: (context) => GeolocationCubit(context.read<GeolocationRepository>())..loadGeolocation())
          ],

          child: Stack(
            children: [
              _buildOffstageNavigator(TabItem.newsfeed),
              _buildOffstageNavigator(TabItem.location),
              _buildOffstageNavigator(TabItem.favourite),
              _buildOffstageNavigator(TabItem.profile),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}