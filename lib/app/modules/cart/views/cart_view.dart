import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/cart/views/checkout.dart';
import 'package:fyp/app/modules/model/cart_details.dart';
import 'package:fyp/app/modules/model/total_cart.dart';
import 'package:fyp/app/modules/navigation/views/navigation_view.dart';
import 'package:fyp/app/modules/utils/user_service.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends StatefulWidget {
  CartView({
    Key? key,
  }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.put(CartController());
  // @override
  // void initState() {
  //   quantity = widget.quantity;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
        leading: IconButton(
            onPressed: () {
              Get.to(() => NavigationView());
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder(
                future: cartController.fetchCart(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error Occurred"));
                  }
                  if (snapshot.hasData) {
                    //  CartDetailsModel cartDetailsModel = cartController.cart[0];
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartController.cart.length,
                        itemBuilder: (context, index) {
                          CartDetailsModel cartDetailsModel =
                              cartController.cart[index];
                          return Column(
                            children: [
                              ListTile(
                                leading: Image.network(
                                    AppApi.urlImage + cartDetailsModel.image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill),
                                title: Text(cartDetailsModel.productName),
                                subtitle: Text('\Rs.${cartDetailsModel.price}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartDetailsModel.quantity == 1
                                            ? null
                                            : cartController
                                                .fetchDecreaseQuantity(
                                                    cartDetailsModel.cartId);
                                        setState(() {
                                          cartDetailsModel.quantity--;
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(cartDetailsModel.quantity.toString()),
                                    IconButton(
                                      onPressed: () {
                                        cartController.fetchIncreaseQuantity(
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
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ColorFyp.blue)),
                        ),
                      ),
                    );
                  }
                }),
            FutureBuilder(
                future: cartController.fetchTotalCart(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error Occurred"));
                  }
                  if (snapshot.hasData) {
                    CartNumberModel cartNumberModel =
                        cartController.cartNumberModel;
                    return Card(
                      elevation: 2,
                      color: Color(0xFF9AF325),
                      child: ListTile(
                        title: Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '\Rs.${cartNumberModel.totalPrice}',
                          style:
                              TextStyle(fontSize: 20.0, color: ColorFyp.black),
                        ),
                      ),
                    );
                  } else {
                    return Transform.scale(
                      scale: 1.4,
                      child: SizedBox(
                        height: Get.size.height / 1.3,
                        child: Center(child: Text("Null")),
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 42, 155, 115))),
              onPressed: () {
                Get.to(() => CheckOut());
                // TODO: Navigate to the payment screen
              },
              child: Text(
                'Proceed to Payment',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF62cda7),
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemCount: controller.cartItems.length + 1,
//           itemBuilder: (context, index) {
//               return Card(
//                 elevation: 2,
//                 color: Color(0xFF9AF325),
//                 child: ListTile(
//                   title: Text(
//                     'Total:',
//                     style:
//                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                   ),
//                   trailing: Text(
//                     '\$${controller.totalCost.toStringAsFixed(2)}',
//                     style: TextStyle(fontSize: 20.0, color: ColorFyp.black),
//                   ),
//                 ),
//               );
//             }

//             // final cartItem = controller.cartItems[index];
//             return ListTile(
//               leading: Image.asset(
//                 'assets/images/${index + 1}.jpg',
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.cover,
//               ),
//               title: Text(cartItem.name),
//               subtitle: Text('\Rs.${cartItem.price.toStringAsFixed(2)}'),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       controller.decrementQuantity(index);
//                     },
//                     icon: Icon(Icons.remove),
//                   ),
//                   Text(cartItem.quantity.toString()),
//                   IconButton(
//                     onPressed: () {
//                       controller.incrementQuantity(index);
//                     },
//                     icon: Icon(Icons.add),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.all(26.0),
//         child: ElevatedButton(
//           style: ButtonStyle(
//               backgroundColor:
//                   MaterialStatePropertyAll(Color.fromARGB(255, 42, 155, 115))),
//           onPressed: () {
//             Get.to(() => CheckOut());
//             // TODO: Navigate to the payment screen
//           },
//           child: Text(
//             'Proceed to Payment',
//             style: TextStyle(
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
