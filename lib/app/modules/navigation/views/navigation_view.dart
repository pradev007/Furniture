import 'package:flutter/material.dart';
import 'package:fyp/app/modules/products/views/products_view.dart';

import 'package:get/get.dart';

import '../../../../fypColor.dart';
import '../../cart/views/cart_view.dart';
import '../../favourite/views/favourite_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/navigation_controller.dart';
import 'package:fyp/app/modules/navigation/views/navigation_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _currentIndex = 0;

  final tabs = [
    const HomeView(),
    const ProductsView(),
    const FavouriteView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorFyp.green,
        type: BottomNavigationBarType.fixed,
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorFyp.yellow,
        unselectedItemColor: ColorFyp.black,
        items: [
          _bottomNavigationBarItem(
            icon: Icons.home,
            label: "Home",
          ),
          _bottomNavigationBarItem(
            icon: Icons.shopping_bag,
            label: "Cart",
          ),
          _bottomNavigationBarItem(
            icon: Icons.favorite,
            label: "Favourite",
          ),
          _bottomNavigationBarItem(
            icon: Icons.person,
            label: "Profile",
          ),
        ],
      ),
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return (BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
      ),
      label: label,
    ));
  }
}
