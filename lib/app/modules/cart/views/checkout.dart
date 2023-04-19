import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/views/order.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: ColorFyp.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/images/5.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Dining Table",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: const [
                              Text(
                                "Quantity: 3",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                "Rs.150",
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          const Text(
                            '2023-04-19',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  // controller:
                  //     signupController.userNameTextEditingController,
                  // key: _userNameFormFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the username field!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorFyp.white,
                    hintText: 'Enter your phone number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  // controller:
                  //     signupController.userNameTextEditingController,
                  // key: _userNameFormFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the username field!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorFyp.white,
                    hintText: 'Enter your street name',
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  // controller:
                  //     signupController.userNameTextEditingController,
                  // key: _userNameFormFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the username field!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorFyp.white,
                    hintText: 'Enter your province',
                    prefixIcon: const Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  // controller:
                  //     signupController.userNameTextEditingController,
                  // key: _userNameFormFieldKey,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the username field!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorFyp.white,
                    hintText: 'Enter your city',
                    prefixIcon: const Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Payment Method:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              // Divider(
              //   thickness: 1,
              //   color: ColorFyp.blue,
              //   indent: 10,
              //   endIndent: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => ColorFyp.blue),
                          value: 1,
                          groupValue: 1,
                          onChanged: (value) {}),
                      Text(
                        "Cash on Delivery",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                      Image.asset(
                        "assets/images/khalti.jpg",
                        width: 80,
                      )

                      // Image.asset(
                      //   "assets/images/khalti.png",
                      //   fit: BoxFit.fill,
                      //   filterQuality: FilterQuality.high,
                      //   width: 100,
                      // )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => OrderDetails());
                },
                // onPressed: () async {
                //   Get.showOverlay(
                //       asyncFunction: () async {
                //         await loginController.handleUserLogin(_formKey);
                //       },
                //       loadingWidget: Transform.scale(
                //         scale: 1.4,
                //         child: SizedBox(
                //           height: Get.size.height / 1.3,
                //           child: Center(
                //             child: CircularProgressIndicator(
                //                 backgroundColor: ColorFyp.gray,
                //                 valueColor:
                //                     AlwaysStoppedAnimation<Color>(
                //                         ColorFyp.blue)),
                //           ),
                //         ),
                //       ));
                //   //   loginController.checkLogin();
                // },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(ColorFyp.yellow),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: ColorFyp.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
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
