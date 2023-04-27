import 'package:flutter/material.dart';
import 'package:fyp/app/modules/cart/controllers/cart_controller.dart';
import 'package:fyp/app/modules/cart/views/order.dart';
import 'package:fyp/app/modules/utils/helpers.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../../../const/app_api.dart';
import '../../model/address_details.dart';
import '../../model/cart_details.dart';
import '../../utils/user_service.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  CartController controller = Get.put(CartController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _amountFormFieldKey = GlobalKey<FormFieldState>();
  final _addressFormFieldKey = GlobalKey<FormFieldState>();
  final _cityFormFieldKey = GlobalKey<FormFieldState>();
  final _numberFormFieldKey = GlobalKey<FormFieldState>();

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
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
                                          Text(
                                              'Rs.${cartDetailsModel.totalPrice.toString()}'),
                                        ],
                                      ),
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
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xFF62cda7),
                  thickness: 2,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "Address Details:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: FutureBuilder(
                      future: controller.fetchAddress(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text("Error Occurred"));
                        }
                        if (snapshot.hasData) {
                          AddressDetailsModel addressDetailsModel =
                              controller.address[0];
                          return Column(
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
                                controller: controller.addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter address';
                                  }
                                  return null;
                                },
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
                                controller: controller.cityController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter city';
                                  }
                                  return null;
                                },
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
                                controller: controller.phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter phone number';
                                  }
                                  return null;
                                },
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
                            ],
                          );
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
                ),
                SizedBox(height: 16.0),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xFF62cda7),
                  thickness: 2,
                ),

                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
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
                        onSuccess: (PaymentSuccessModel paymentSuccessModel) {
                          var amount = paymentSuccessModel.amount ~/ 100;
                          controller.makeOrder(amount);
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
                      backgroundColor:
                          MaterialStateProperty.all(ColorFyp.yellow),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Procced To Khalti',
                        style: TextStyle(
                          color: ColorFyp.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
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
