import 'package:flutter/material.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
import 'package:fyp/app/modules/navigation/views/navigation_view.dart';
import 'package:fyp/fypColor.dart';

import 'package:get/get.dart';

import '../controllers/shop_now_controller.dart';

class ShopNowView extends GetView<ShopNowController> {
  const ShopNowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: ColorFyp.green,
                expandedHeight: 10.0,
                floating: false,
                pinned: false,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Discounted Products",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                leading: BackButton(
                  onPressed: () => Get.off(NavigationView()),
                )),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sofa.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "discount%: \nPrice:  ",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bed.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "discount%: \nPrice:  ",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/table.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // const ListTile(
            //   leading:
            //     // place icons here
            // ),
            const Text(
              "discount%: \nPrice:  ",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/daraj.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "discount%: \nPrice:  ",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/hood.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "discount%: \nPrice:  ",
              style: TextStyle(decoration: TextDecoration.none, fontSize: 20.0),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
