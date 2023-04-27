import 'package:flutter/material.dart';
import 'package:fyp/app/modules/login/views/login_view.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);
  SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/1.jpg',
              ),
              const Text(
                ' Best Furniture at\n your finger tip',
                style: TextStyle(fontSize: 40.0),
              ),
              ElevatedButton(
                onPressed: () => Get.to(LoginView()),
                style: ElevatedButton.styleFrom(),
                // style: ButtonStyle(
                //   backgroundColor:
                //       MaterialStateProperty.all(ColorFyp.green),
                // ),
                child: const Text(
                  "Let's Go",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
