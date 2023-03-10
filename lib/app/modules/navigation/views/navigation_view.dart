import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/favourite/views/favourite_view.dart';
import 'package:fyp/app/modules/shopNow/views/shop_now_view.dart';
import 'package:fyp/app/modules/trending/views/trending_view.dart';

import '../../categories/views/categories_view.dart';
import '../../home/views/home_view.dart';
import '../../products/views/products_view.dart';
import '../../profile/views/profile_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [
    HomeView(),
    const FavouriteView(),
    const CartView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: ('Favourite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: ('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
