import 'package:flutter/material.dart';
import 'package:fyp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../../../fypColor.dart';

class AddressDetails extends StatelessWidget {
  AddressDetails({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _addressFormFieldKey = GlobalKey<FormFieldState>();
  final _cityFormFieldKey = GlobalKey<FormFieldState>();
  final _numberFormFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Details"),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  key: _addressFormFieldKey,
                  controller:
                      profileController.userAddressTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your user name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   _firstName = value!;
                  // },
                ),
                SizedBox(height: 16.0),
                Text(
                  'City',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  key: _cityFormFieldKey,
                  controller: profileController.cityTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your city',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your phone number';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   _lastName = value!;
                  // },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  key: _numberFormFieldKey,
                  controller: profileController.numberTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your phone number';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   _lastName = value!;
                  // },
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    // onPressed: () {
                    //   Get.to(() => NavigationView());
                    // },
                    onPressed: () async {
                      Get.showOverlay(
                          asyncFunction: () async {
                            await profileController.addAddresses();
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
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorFyp.yellow),
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: ColorFyp.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
