import 'package:flutter/material.dart';
import 'package:fyp/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/app/modules/signup/views/signup_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'eFurniture',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: Get.size.height * 0.3,
              width: double.infinity,
              color: ColorFyp.yellow,
              // width: 300,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Container(
              height: Get.size.height * 0.7,
              width: double.infinity,
              color: ColorFyp.green,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 241, 241, 241),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username'),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'password',
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(const ForgotPasswordView()),
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          color: ColorFyp.blue,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed("home");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorFyp.yellow),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: ColorFyp.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text("Dont't have an account?",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    TextButton(
                        onPressed: () => Get.to(const SignupView()),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorFyp.blue,
                            fontSize: 24.0,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
