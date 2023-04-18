import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/cart_view.dart';
import 'package:fyp/app/modules/favourite/views/favourite_view.dart';
import 'package:fyp/app/modules/login/views/login_view.dart';
import 'package:fyp/app/modules/profile/views/about_us_view.dart';
import 'package:fyp/app/modules/profile/views/edit_profile_view.dart';
import 'package:fyp/app/modules/profile/views/feedback_view.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final tileName = [
    "Edit Profile",
    "Favourite",
    "Cart",
    "About Us",
    "Feedback",
    "LogOut"
  ];

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: SafeArea(
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
              "Pradip Devkota",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Text(
              "pradipdevkota007@gmail.com",
              style: TextStyle(fontSize: 15.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
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
                          Get.defaultDialog(
                            title: "Log Out",
                            middleText: "Are you sure you want to log out?",
                            confirm: ElevatedButton(
                              onPressed: () {
                                // Log out and return to login page
                                Get.offAll(LoginView());
                              },
                              child: Text('Yes'),
                            ),
                            cancel: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Cancel'),
                            ),
                          );
                        },
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
    );
  }
}
