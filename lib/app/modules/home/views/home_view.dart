import 'package:flutter/material.dart';
import 'package:fyp/app/modules/categories/views/categories_view.dart';
import 'package:fyp/app/modules/navigation/views/navigation_view.dart';
import 'package:fyp/app/modules/products/views/products_view.dart';
import 'package:fyp/app/modules/shopNow/views/shop_now_view.dart';
import 'package:fyp/app/modules/trending/views/trending_view.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../fypColor.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable, constant_identifier_names
class  HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);

  final List<String> images = [
    'assets/images/trend.jpg',
    'assets/images/trend1.jpg',
    'assets/images/trend2.jpg',
    'assets/images/trend3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => Get.to( HomeView()),
              icon: Image.asset(
                'assets/images/1.jpg',
              ),
            ),
          )
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorFyp.trans_black,
                  size: 30.0,
                ),
                filled: true,
                fillColor: ColorFyp.gray,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: ColorFyp.trans_black,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Trendings",
              style: TextStyle(
                  color: ColorFyp.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          Hero(
            tag: 'con1',
            child: Container(
              child: createHorizontalImageList(
                [
                  "assets/images/bed.jpg",
                  "assets/images/sofa.jpg",
                  "assets/images/bed.jpg",
                  "assets/images/sofa.jpg",
                  "assets/images/bed.jpg",
                ],
                GestureDetector(
                  onTap: () => Get.off(const TrendingView()),
                ),
              ),
            ),
          ),
          //  --------------------------------------- End of Trendings --------------------------------------------

          // ---------------------------------------------------------------------------------------------------------------

          Container(
            color: ColorFyp.green,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Daily discounts \n      upto 70%",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(ColorFyp.brown),
                  ),
                  onPressed: (() => Get.off(
                        const ShopNowView(),
                      )),
                  child: const Text(
                    "Shop Now",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //------------------------- categories ----------------------------------

          Container(
            child: createHorizontalImageList(
              [
                "assets/images/bed.jpg",
                "assets/images/sofa.jpg",
                "assets/images/bed.jpg",
                "assets/images/sofa.jpg",
                "assets/images/bed.jpg",
              ],
              GestureDetector(
                onTap: () => Get.off(const CategoriesView()),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Just for you ",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),

          CarouselSlider(
            items: images.map((image) {
              return Image.asset(
                image,
                fit: BoxFit.fill,
              );
            }).toList(),
            options: CarouselOptions(
                height: 210.0,
                autoPlay: true,
                viewportFraction: 1,
                padEnds: false),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Most selling ",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: 150,
            height: 150,
            child: Container(
              decoration:  const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bed.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: 150,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bed.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Latest",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: (() => Get.off(ProductsView())),
            child: Image.asset("assets/images/bed.jpg"),
          ),
        ],
      ),
      // bottomNavigationBar: const NavigationView(),
    );
  }

  Widget displayImageAndText(String imagePath, String text1, String text2,
      String text3, String text4, String text5) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: ColorFyp.yellow)),
      child: Column(
        children: [
          Image.asset(imagePath),
          // Heading of Product or Product title
          Text(
            text1,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          // First bullet point to describe the product
          ListTile(
            horizontalTitleGap: -5.0,
            leading: const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text2,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(153, 3, 3, 3),
                ),
              ),
            ),
          ),
          // Second bullet point to describe the product
          ListTile(
            horizontalTitleGap: -5.0,
            leading: const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text3,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(153, 3, 3, 3),
                ),
              ),
            ),
          ),
          // Third bullet point to describe the product
          ListTile(
            horizontalTitleGap: -5.0,
            leading: const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text4,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(153, 3, 3, 3),
                ),
              ),
            ),
          ),
          // Fourth bullet point to describe the product
          ListTile(
            horizontalTitleGap: -5.0,
            leading: const CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.green,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text5,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(153, 3, 3, 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget createHorizontalImageList(
    List<String> imagePaths, GestureDetector gestureDetector) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: imagePaths
          .map((imagePath) => Container(
              padding: const EdgeInsets.all(10.0),
              width: 150,
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                )),
                child: gestureDetector,
              )))
          .toList(),
    ),
  );
}
