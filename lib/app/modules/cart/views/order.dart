import 'package:flutter/material.dart';
import 'package:fyp/app/modules/utils/helpers.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        backgroundColor: Color(0xFF62cda7),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: ColorFyp.blue),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Order Date: 2023-04-19",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Divider(thickness: 1, color: AppColors.paletteB),
                  Text(
                    "Item Detail",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6.0),
                  Container(
                    height: Get.size.height * 0.18,
                    width: Get.size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: AssetImage("assets/images/5.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(height: 6.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "Dining Table",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Quantity:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "3",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Price:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "Rs.50",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Total price:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "Rs.150",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  // Divider(thickness: 1, color: AppColors.paletteB),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Address:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "Rambazar",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "City:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "Pokhara",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Province:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "4",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Phone number:",
                          style: TextStyle(
                              // color: AppColors.paletteB,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6.0),
                        const Text(
                          "9867434543",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () {
              // Get.to(() => OrderDetails());
              Helpers.showMessage(
                  message: "Order has been placed successfully");
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
      )),
    );
  }
}
