import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/favourite/views/favourite_view.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends StatefulWidget {
   NavigationView({Key? key}) : super(key: key);
  NavigationController navigationController = Get.find();

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [
    HomeView(),
    FavouriteView(),
    CartView(),
    ProfileView(),
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
        backgroundColor: Color(0xFF62cda7),
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
        selectedItemColor: ColorFyp.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
