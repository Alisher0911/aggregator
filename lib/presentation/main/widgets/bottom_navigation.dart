import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/consts/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const BottomNavigation({
    super.key,
    required this.currentTab,
    required this.onSelectTab
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
          "Лента",
          "assets/bottom_navigation_bar_items/newsfeed.svg"
        ),
        _buildItem(
          "Карта",
          "assets/bottom_navigation_bar_items/map.svg"
        ),
        _buildItem(
          "Избранные",
          "assets/bottom_navigation_bar_items/favourite.svg"
        ),
        _buildItem(
          "Профиль",
          "assets/bottom_navigation_bar_items/profile.svg"
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: purpleColor,
      selectedLabelStyle: GoogleFonts.manrope(
        textStyle: const TextStyle(fontSize: 10)
      ),
      unselectedLabelStyle: GoogleFonts.manrope(
        textStyle: const TextStyle(fontSize: 10, color: Colors.black)
      ),
    );
  }


   BottomNavigationBarItem _buildItem(String label, String assetName) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          assetName,
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          assetName,
          height: 20,
          width: 20,
          color: purpleColor,
        ),
      ),
      label: label,
    );
  }
}