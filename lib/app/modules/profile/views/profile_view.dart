import 'package:flutter/material.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../navigation/views/navigation_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final tileName = [
    "Shipping Address",
    "Payment",
    "Delivery Status",
    "Change Password",
    "Change Email",
    "Change Number",
    "Help",
    "Log Out"
  ];
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProfileView'),
          leading: IconButton(
              onPressed: (() => Get.off(NavigationView())),
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Color(0xFF62cda7),
        ),
        body: Column(
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
                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        title: Text(tileName[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
