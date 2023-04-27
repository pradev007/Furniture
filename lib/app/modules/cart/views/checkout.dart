import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/controllers/cart_controller.dart';
import 'package:fyp/app/modules/cart/views/order.dart';
import 'package:fyp/app/modules/utils/helpers.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../../../const/app_api.dart';
import '../../model/cart_details.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  CartController controller = Get.put(CartController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FutureBuilder(
                    future: controller.fetchCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text("Error Occurred"));
                      }
                      if (snapshot.hasData) {
                        //  CartDetailsModel cartDetailsModel = cartController.cart[0];
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.cart.length,
                            itemBuilder: (context, index) {
                              CartDetailsModel cartDetailsModel =
                                  controller.cart[index];
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                        AppApi.urlImage +
                                            cartDetailsModel.image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill),
                                    title: Text(cartDetailsModel.productName),
                                    subtitle:
                                        Text('\Rs.${cartDetailsModel.price}'),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            controller.fetchDecreaseQuantity(
                                                cartDetailsModel.cartId);
                                            setState(() {
                                              cartDetailsModel.quantity--;
                                            });
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text(cartDetailsModel.quantity
                                            .toString()),
                                        IconButton(
                                          onPressed: () {
                                            controller.fetchIncreaseQuantity(
                                                cartDetailsModel.cartId);
                                            setState(() {
                                              cartDetailsModel.quantity++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                      } else {
                        return Transform.scale(
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
                        );
                      }
                    }),

                // address section
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: controller.phoneContoller,
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
                    controller: controller.streetContoller,
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
                    controller: controller.cityContoller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field need to be fillled";
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
                const Padding(
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

                ElevatedButton(
                  onPressed: () {
                    KhaltiScope.of(context).pay(
                      preferences: [PaymentPreference.khalti],
                      config: PaymentConfig(
                          amount: int.parse(controller
                                  .cartNumberModel.totalPrice
                                  .toString()) *
                              100,
                          productIdentity: "productIdentity",
                          productName: "productName"),
                      onSuccess:
                          (PaymentSuccessModel paymentSuccessModel) async {
                        var amount = paymentSuccessModel.amount ~/ 100;
                        Helpers.showMessage(message: "Payment Successfully");
                      },
                      onFailure: (PaymentFailureModel failure) {
                        debugPrint(
                          "Error occcured $failure",
                        );
                      },
                      onCancel: () {
                        debugPrint('Cancelled');
                      },
                    );
                  },
                  child: Row(
                    children: [
                      const Text("Pay with Khalti"),
                      Image.asset("assets/images/khalti.png")
                    ],
                  ),
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Radio(
                //             fillColor: MaterialStateColor.resolveWith(
                //                 (states) => ColorFyp.blue),
                //             value: 1,
                //             groupValue: 1,
                //             onChanged: (value) {}),
                //        const Text(
                //           "Cash on Delivery",
                //           style: TextStyle(
                //               fontSize: 16, fontWeight: FontWeight.w500),
                //         )
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         Radio(value: 1, groupValue: 0, onChanged: (value) {}),
                //         Image.asset(
                //           "assets/images/khalti.jpg",
                //           width: 80,
                //         )

                //         // Image.asset(
                //         //   "assets/images/khalti.png",
                //         //   fit: BoxFit.fill,
                //         //   filterQuality: FilterQuality.high,
                //         //   width: 100,
                //         // )
                //       ],
                //     ),
                //   ],
                // ),
                ,
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
      ),
    );
  }
}
