import 'package:flutter/material.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eFurniture'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: Get.size.height * 0.3,
              width: double.infinity,
              color: ColorFyp.green,
              child: const Image(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
            Container(
              height: Get.size.height * 0.7,
              width: double.infinity,
              color: ColorFyp.yellow,
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'SignUp Now',
                    style: TextStyle(
                      color: ColorFyp.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorFyp.white,
                        hintText: 'username',
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorFyp.white,
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 30.0,
                          ),
                          hintText: 'email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorFyp.white,
                        prefixIcon: const Icon(
                          Icons.phone_iphone,
                          size: 30.0,
                        ),
                        hintText: 'phone',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorFyp.white,
                        prefixIcon: const Icon(
                          Icons.lock,
                          size: 30.0,
                        ),
                        hintText: 'password',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to( HomeView()),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorFyp.green),
                    ),
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        color: ColorFyp.black,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
