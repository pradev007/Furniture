import 'package:flutter/material.dart';
import 'package:fyp/app/modules/home/views/home_view.dart';
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
                    "My App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                leading: BackButton(
                  onPressed: () => Get.off( HomeView()),
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "1 \n2",
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "1 \n2",
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // const ListTile(
            //   leading: 
            //     // place icons here
            // ),
            const Text(
              "1 \n2",
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "1 \n2",
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
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              "1 \n2",
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
