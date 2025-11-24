import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/features/cart/cart_page.dart';
import 'package:nectar/features/favorites/favorites_page.dart';
import 'package:nectar/features/home/presenattion/screens/home_page.dart';
import 'package:nectar/features/profile/profile_page.dart';
import 'package:nectar/features/search/search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 0),
        backgroundColor: Colors.white,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: 70.0,
        navBarStyle: NavBarStyle.style6,
        onItemSelected: (index) {
          setState(() {
            _controller.index = index; // Update the controller index
          });
        },
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      SearchPage(),
      CartPage(),
      FavoritesPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavBarItem("assets/icons/shop.svg", 0),
      _buildNavBarItem("assets/icons/search.svg", 1),
      _buildNavBarItem("assets/icons/shopping-cart.svg", 2),
      _buildNavBarItem("assets/icons/favorite.svg", 3),
      _buildNavBarItem("assets/icons/user.svg", 4),
    ];
  }

  PersistentBottomNavBarItem _buildNavBarItem(String iconPath, int index) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: _controller.index == index
            ? const ColorFilter.mode(
                Color(0XFF53B175),
                BlendMode.srcIn,
              ) // Color for the selected item
            : const ColorFilter.mode(
                Color(0XFF344356),
                BlendMode.srcIn,
              ), // Color for the unselected item
        height: 30, // Optional: Set height to match icon size
        width: 30, // Optional: Set width to match icon size
      ),
      iconSize: 35,
    );
  }
}
