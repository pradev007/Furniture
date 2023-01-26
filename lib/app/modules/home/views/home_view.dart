import 'package:flutter/material.dart';
import 'package:fyp/app/modules/profile/views/profile_view.dart';
import 'package:fyp/fypColor.dart';
import 'package:get/get.dart';
import '../../products/views/products_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () => Get.to(const HomeView()),
                  icon: Image.asset(
                    'assets/images/1.jpg',
                  )))
        ],
        toolbarHeight: 60.0,
        flexibleSpace: SafeArea(
          child: Container(
            color: ColorFyp.green,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(0.0),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(color: ColorFyp.white, fontSize: 15.0),
                ),
                Text(
                  "Pradip Devkota  ",
                  style: TextStyle(color: ColorFyp.yellow, fontSize: 25.0),
                )
              ],
            ),
          ),
        ),
      ),

      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     // Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //   child: TextFormField(
      //     //     decoration: InputDecoration(
      //     //       border: const OutlineInputBorder(),
      //     //       contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
      //     //       prefixIcon: Icon(
      //     //         Icons.search,
      //     //         color: ColorFyp.trans_black,
      //     //         size: 30.0,
      //     //       ),
      //     //       filled: true,
      //     //       fillColor: ColorFyp.gray,
      //     //       hintText: 'Search',
      //     //       hintStyle: TextStyle(
      //     //         color: ColorFyp.trans_black,
      //     //         fontSize: 20.0,
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //     Padding(
      //       padding: const EdgeInsets.all(12.0),
      //       child: Text(
      //         "Trending",
      //         style: TextStyle(
      //             color: ColorFyp.black,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20.0),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 100.0,
      //       // margin: const EdgeInsets.symmetric(vertical: 0.0),

      //       child: ListView(
      //         scrollDirection: Axis.horizontal,
      //         children: [
      //           Container(
      //             alignment: Alignment.bottomCenter,
      //             width: 100.0,
      //             // height: 50.0,
      //             margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      //             decoration: const BoxDecoration(
      //               // color: ColorFyp.blue,
      //               image: DecorationImage(
      //                 image: AssetImage(
      //                   'assets/images/sofa.jpg',
      //                 ),
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //             child: Text(
      //               '',
      //               style: TextStyle(
      //                 fontSize: 20.0,
      //                 color: ColorFyp.black,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             alignment: Alignment.center,
      //             width: 100.0,
      //             margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      //             decoration: const BoxDecoration(
      //               // color: ColorFyp.blue,
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/bed.jpg'),
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             alignment: Alignment.center,
      //             width: 100.0,
      //             height: 50.0,
      //             margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      //             decoration: const BoxDecoration(
      //               // color: ColorFyp.blue,
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/bed.jpg'),
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             alignment: Alignment.center,
      //             width: 100.0,
      //             height: 50.0,
      //             margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      //             decoration: const BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/bed.jpg'),
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 100.0,
      //             alignment: Alignment.center,
      //             margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      //             decoration: const BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/bed.jpg'),
      //                 alignment: Alignment.center,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Container(
      //       height: 70.0,
      //       width: double.infinity,
      //       color: ColorFyp.green,
      //       alignment: Alignment.centerRight,
      //       // padding: const EdgeInsets.only(right: 10.0, top: 10.0),
      //       child: Column(
      //         children: [
      //           // paddingAll(10.0),
      //           ElevatedButton(
      //             onPressed: (() {}),
      //             style: ButtonStyle(
      //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(18.0))),
      //               backgroundColor: MaterialStateProperty.all(ColorFyp.yellow),
      //             ),
      //             child: Text(
      //               "Shop Now",
      //               style: TextStyle(color: ColorFyp.black, fontSize: 15.0),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     const Padding(
      //       padding: EdgeInsets.only(left: 12.0),
      //       child: Text(
      //         "Top Products",
      //         style: TextStyle(
      //             // color: ColorFyp.black,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20.0),
      //       ),
      //     ),
      //     // const Expanded(child: ProductsView()),
      //   ],
      // ),
    );
  }
}
