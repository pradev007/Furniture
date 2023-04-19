import 'package:flutter/material.dart';
import 'package:fyp/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:fyp/app/modules/signup/views/signup_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';
import '../../navigation/views/navigation_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.size.height * 0.3,
                width: double.infinity,
                color: ColorFyp.green,
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
                        key: _emailFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the email field!";
                          }
                          return null;
                        },
                        controller: loginController.emailTextEditingController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(255, 241, 241, 241),
                            prefixIcon: Icon(Icons.person),
                            hintText: 'Enter your email'),
                      ),
                      const SizedBox(height: 24.0),
                      TextFormField(
                        key: _passwordFormFieldKey,
                        controller:
                            loginController.passwordTextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the password field!";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 241, 241, 241),
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Enter your password',
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
                        // onPressed: () {
                        //   Get.to(() => NavigationView());
                        // },
                        onPressed: () async {
                          Get.showOverlay(
                              asyncFunction: () async {
                                await loginController.handleUserLogin(_formKey);
                              },
                              loadingWidget: Transform.scale(
                                scale: 1.4,
                                child: SizedBox(
                                  height: Get.size.height / 1.3,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        backgroundColor: ColorFyp.gray,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                ColorFyp.blue)),
                                  ),
                                ),
                              ));
                          //   loginController.checkLogin();
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
                          onPressed: () => Get.to(() => SignupView()),
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
      ),
    );
  }
}
