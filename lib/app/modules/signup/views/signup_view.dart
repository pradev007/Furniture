import 'package:flutter/material.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  SignupController signupController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //   userAddress: userAddressTextEditingController.text,
  // userContact: contactTextEditingController.text,
  // userEmail: userEmailTextEditingController.text,
  // userName: userNameTextEditingController.text,
  // password: passwordTextEditingController.text,
  final _addressFormFieldKey = GlobalKey<FormFieldState>();
  final _userEmailFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  final _userNameFormFieldKey = GlobalKey<FormFieldState>();
  final _userContactFormFieldKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Form(
                key: _formKey,
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
                        controller:
                            signupController.userNameTextEditingController,
                        key: _userNameFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the username field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorFyp.white,
                          hintText: 'Enter username',
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
                        controller:
                            signupController.userEmailTextEditingController,
                        key: _userEmailFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the email field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorFyp.white,
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 30.0,
                            ),
                            hintText: 'Enter email'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller:
                            signupController.contactTextEditingController,
                        key: _userContactFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the phone number field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorFyp.white,
                          prefixIcon: const Icon(
                            Icons.phone_iphone,
                            size: 30.0,
                          ),
                          hintText: 'Enter phone number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller:
                            signupController.userAddressTextEditingController,
                        key: _addressFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the address field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorFyp.white,
                          prefixIcon: const Icon(
                            Icons.location_on,
                            size: 30.0,
                          ),
                          hintText: 'Enter address',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        controller:
                            signupController.passwordTextEditingController,
                        key: _passwordFormFieldKey,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill the password field!";
                          }
                          return null;
                        },
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
                      onPressed: () async {
                        Get.showOverlay(
                            asyncFunction: () async {
                              await signupController.register();
                            },
                            loadingWidget: Transform.scale(
                              scale: 1.4,
                              child: SizedBox(
                                height: Get.size.height / 1.3,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      backgroundColor: ColorFyp.gray,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          ColorFyp.blue)),
                                ),
                              ),
                            ));
                        //   loginController.checkLogin();
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
