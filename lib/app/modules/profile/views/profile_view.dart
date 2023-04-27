import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/favourite/views/favourite_view.dart';
import 'package:fyp/app/modules/login/views/login_view.dart';
import 'package:fyp/app/modules/profile/views/about_us_view.dart';
import 'package:fyp/app/modules/profile/views/address.dart';
import 'package:fyp/app/modules/profile/views/edit_profile_view.dart';
import 'package:fyp/app/modules/profile/views/feedback_view.dart';
import 'package:fyp/app/modules/profile/views/orders_history.dart';
import 'package:get/get.dart';
import '../../utils/user_service.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final tileName = [
    "Edit Profile",
    "Favourite",
    "Address",
    "Cart",
    "Order History",
    "About Us",
    "Feedback",
    "LogOut"
  ];

  ProfileView({Key? key}) : super(key: key);
  UserService userService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.1,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                  radius: 40.0,
                ),
              ),
              Text(
                userService.user.userName,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                userService.user.userEmail,
                style: TextStyle(fontSize: 15.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tileName.length,
                  itemBuilder: (BuildContext context, int index) {
                    switch (tileName[index]) {
                      case "Edit Profile":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "Favourite":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FavouriteView(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "Address":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddressDetails(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "Cart":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartView(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "Order History":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderHistory(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "About Us":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUsPage(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "Feedback":
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FeedbackView(),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      case "LogOut":
                        return GestureDetector(
                          onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: const Center(child: Text('Plant In')),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'No',
                                style: TextStyle(
                                    color: AppColors.paletteB,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                UserService.logOut();
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.paletteB,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                        }
                        );
                          child: Card(
                            child: ListTile(
                              title: Text(tileName[index]),
                            ),
                          ),
                        );
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
