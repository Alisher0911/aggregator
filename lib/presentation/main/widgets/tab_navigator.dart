import 'package:aggregator/consts/tab_item.dart';
import 'package:aggregator/presentation/favourite/favourite_screen.dart';
import 'package:aggregator/presentation/location/location_screen.dart';
import 'package:aggregator/presentation/newsfeed/newsfeed_screen.dart';
import 'package:aggregator/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem
  });


  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    if (tabItem == TabItem.newsfeed) {
      child = const NewsfeedScreen();
    } else if (tabItem == TabItem.location) {
      child = const LocationScreen();
    } else if (tabItem == TabItem.favourite) {
      child = const FavouriteScreen();
    } else if (tabItem == TabItem.profile) {
      child = const ProfileScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}