import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../../../fypColor.dart';
import '../../model/order_details.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({Key? key}) : super(key: key);
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          centerTitle: true,
          backgroundColor: Color(0xFF62cda7),
        ),
        body: FutureBuilder(
            future: profileController.fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("Error Occurred"));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: profileController.orders.length,
                    itemBuilder: (BuildContext, int index) {
                      OrderDetailsModel orderDetailsModel =
                          profileController.orders[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: Get.size.height * 0.22,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 1),
                                        blurRadius: 6)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Row(children: [
                                  Container(
                                    height: Get.size.height * 0.18,
                                    width: Get.size.width * 0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                AppApi.urlImage +
                                                    orderDetailsModel.image),
                                            fit: BoxFit.fill)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0, horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(orderDetailsModel.productName,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 8),
                                          Text(
                                              "Quantity: ${orderDetailsModel.quantity}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 8),
                                          Text(
                                              "Price: Rs.${orderDetailsModel.price}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 8),
                                          Text(
                                              "Total price: Rs.${orderDetailsModel.totalPrice}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
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
            }));
  }
}
