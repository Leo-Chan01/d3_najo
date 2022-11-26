import 'package:dnajo_homes/pages/drawer/home_navigation.dart';
import 'package:dnajo_homes/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'accessories_page.dart';
import 'automobiles_page.dart';
import 'building_materials_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const NavigationHomePage(),
      const AccessoriesPage(),
      const BuildingMaterialsPage(),
      const AutomobilesPage()
    ];
  }

  _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_filled),
          title: "Home",
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.face_retouching_natural),
          title: "Accessories",
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.carpenter_rounded),
          title: "Building",
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.car_rental_rounded),
          title: "Auto",
          activeColorPrimary: kPrimaryColor,
          inactiveColorPrimary: Colors.grey),
    ];
  }
}
