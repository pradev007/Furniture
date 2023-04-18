import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fyp/app/const/app_api.dart';
import 'package:fyp/app/modules/categories/bindings/categories_binding.dart';
import 'package:fyp/app/modules/categories/controllers/categories_controller.dart';
import 'package:fyp/app/modules/model/category.dart';
import 'package:fyp/app/modules/products/bindings/products_binding.dart';
import 'package:fyp/app/modules/products/controllers/products_controller.dart';
import 'package:get/get.dart';
import '../../../../fypColor.dart';
import '../../categories/views/categories_view.dart';
import '../../model/latest_product.dart';
import '../../products/views/products_view.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable, constant_identifier_names
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorFyp.green,
        flexibleSpace: SafeArea(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            Text(
              "Category",
              style: TextStyle(
                  color: ColorFyp.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: Get.size.height * 0.2,
              child: FutureBuilder(
                  future: homeController.fetchCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text("Error Occurred"));
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.category.length,
                          // itemCount: homeController.latestProduct.length,
                          itemBuilder: (context, index) {
                            CategoryModel categoryModel =
                                homeController.category[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 12.0),
                              child: Container(
                                width: Get.size.width * 0.35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 4)
                                    ]),
                                child: GestureDetector(
                                  onTap: () {
                                    CategoriesController categoriesController =
                                        Get.find();
                                    categoriesController.categoryId =
                                        categoryModel.catId;
                                    Get.to(() => CategoriesView(),
                                        binding: CategoriesBinding());
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: Get.size.height * 0.13,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    AppApi.urlImage +
                                                        categoryModel.image),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(12.0))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6.0),
                                        child: Text(categoryModel.type,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Text("");
                    }
                  }),
            ),
            Text(
              "Trending",
              style: TextStyle(
                  color: ColorFyp.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            FutureBuilder(
                future: homeController.fetchLatestProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error Occurred"));
                  }
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: Get.size.height * 0.3,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.latestProduct.length,
                          itemBuilder: (context, index) {
                            LatestArrivalModel latestArrivalModel =
                                homeController.latestProduct[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 12.0),
                              child: Container(
                                width: Get.size.width * 0.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0, 1),
                                          blurRadius: 4)
                                    ]),
                                child: GestureDetector(
                                  onTap: () {
                                    ProductsController productsController =
                                        Get.find();
                                    productsController.productDetailId =
                                        latestArrivalModel.productId;
                                    Get.to(() => ProductsView(),
                                        binding: ProductsBinding());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Get.size.height * 0.2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/1.jpg"),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(12.0),
                                                    topRight:
                                                        Radius.circular(12.0))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("productName",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons
                                                      .favorite_outline_outlined,
                                                  color: ColorFyp.gray,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
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
            Text(
              "Best Selling",
              style: TextStyle(
                  color: ColorFyp.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 12.0),
                    child: Container(
                      // width: Get.size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 4)
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => ProductsView());
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.size.height * 0.15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/1.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("productName",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_outline_outlined,
                                        color: ColorFyp.gray,
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Rs.",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                        // Gap(6.0),
                                        Text("200",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: ColorFyp.green,
                                        ),
                                        child: const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
// crousal slider images---------------------------------------------------
//   final List<Map<String, String>> images = [
//     {
//       'path': 'assets/images/cbed.jpg',
//       'name': 'Image 1',
//       'price': "Price: \$" '20',
//     },
//     {
//       'path': 'assets/images/cbed2.jpg',
//       'name': 'Image 2',
//       'price': "Price: \$" '30',
//     },
//     {
//       'path': 'assets/images/ctable.jpg',
//       'name': 'Image 3',
//       'price': "Price: \$" '40',
//     },
//   ];

//   final List<Product> products = [
//     const Product(image: 'assets/images/2.jpg', name: 'Product 2', price: 20.0),
//     const Product(image: 'assets/images/3.jpg', name: 'Product 3', price: 30.0),
//     const Product(image: 'assets/images/4.jpg', name: 'Product 4', price: 40.0),
//     const Product(image: 'assets/images/5.jpg', name: 'Product 5', price: 50.0),
//     const Product(image: 'assets/images/6.jpg', name: 'Product 6', price: 60.0),
//     const Product(image: 'assets/images/7.jpg', name: 'Product 7', price: 70.0),
//     const Product(image: 'assets/images/8.jpg', name: 'Product 8', price: 80.0),
//     const Product(image: 'assets/images/9.jpg', name: 'Product 9', price: 90.0),
//     const Product(
//         image: 'assets/images/10.jpg', name: 'Product 1', price: 100.0),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           GestureDetector(
//             onTap: () => Get.off(ProfileView()),
//             child: CircleAvatar(
//               radius: 40.0,
//               backgroundImage: AssetImage("assets/images/profile.jpg"),
//             ),
//           ),
//         ],
//         toolbarHeight: 50.0,
//         flexibleSpace: SafeArea(
//           child: Container(
//             color: ColorFyp.green,
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(0.0),
//                 ),
//                 Text(
//                   'Welcome',
//                   style: TextStyle(color: ColorFyp.white, fontSize: 15.0),
//                 ),
//                 Text(
//                   "Pradip Devkota  ",
//                   style: TextStyle(color: ColorFyp.yellow, fontSize: 25.0),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: const OutlineInputBorder(),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 40.0),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: ColorFyp.trans_black,
//                   size: 30.0,
//                 ),
//                 filled: true,
//                 fillColor: ColorFyp.gray,
//                 hintText: 'Search',
//                 hintStyle: TextStyle(
//                   color: ColorFyp.trans_black,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: Text(
//               "Trendings",
//               style: TextStyle(
//                   color: ColorFyp.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0),
//             ),
//           ),
//           Hero(
//             tag: 'con1',
//             child: Container(
//               child: createHorizontalImageList(
//                 [
//                   "assets/images/bed.jpg",
//                   "assets/images/sofa.jpg",
//                   "assets/images/bed.jpg",
//                   "assets/images/sofa.jpg",
//                   "assets/images/bed.jpg",
//                 ],
//                 GestureDetector(
//                   onTap: () => Get.off(const TrendingView()),
//                 ),
//               ),
//             ),
//           ),
//           //  --------------------------------------- End of Trendings --------------------------------------------

//           // ---------------------------------------------------------------------------------------------------------------

//           Container(
//             color: ColorFyp.green,
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 const Text(
//                   "Daily discounts \n      upto 70%",
//                   style: TextStyle(
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                     ),
//                     backgroundColor: MaterialStateProperty.all(ColorFyp.brown),
//                   ),
//                   onPressed: (() => Get.off(
//                         const ShopNowView(),
//                       )),
//                   child: const Text(
//                     "Shop Now",
//                     style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.only(left: 10.0, top: 10.0),
//             child: Text(
//               "Categories",
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),

//           //------------------------- categories ----------------------------------

//           createHorizontalImageList(
//               GestureDetector(
//                 onTap: () => Get.off(CategoriesView()),
//               ),
//             ),

//           // ----------------------- Crousel Slider----Just for you -------------------
//           const Padding(
//             padding: EdgeInsets.only(left: 10.0),
//             child: Text(
//               "Just for you ",
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//           ),

//           CarouselSlider(
//             items: images.map((image) {
//               return Column(
//                 children: [
//                   Image.asset(
//                     image['path']!,
//                     fit: BoxFit.fill,
//                   ),
//                   const SizedBox(height: 5.0),
//                   Text(
//                     image['name']!,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5.0),
//                   Text(
//                     image['price']!,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               );
//             }).toList(),
//             options: CarouselOptions(
//               height: 260.0,
//               autoPlay: true,
//               viewportFraction: 1,
//               padEnds: false,
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.only(left: 10.0, top: 10.0),
//             child: Text(
//               "Most selling ",
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),

//           // -------------------------- Most Selling -------------------------
//           SingleChildScrollView(
//             // physics: const NeverScrollableScrollPhysics(),
//             child: GridView.builder(
//               shrinkWrap: true,
//               itemCount: products.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, // Display 3 items in a row
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 1.0, // Square aspect ratio
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 final product = products[index];
//                 return Column(
//                   children: [
//                     Image.asset(
//                       product.image,
//                       fit: BoxFit.cover,
//                     ),
//                     const SizedBox(
//                         height:
//                             5), // Add some spacing between the image and text
//                     Text(
//                       product.name,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '\$${product.price}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),

//           // Container(
//           //   padding: const EdgeInsets.all(10.0),
//           //   width: 150,
//           //   height: 150,
//           //   child: Container(
//           //     decoration: const BoxDecoration(
//           //       image: DecorationImage(
//           //         image: AssetImage("assets/images/bed.jpg"),
//           //         fit: BoxFit.fill,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           // Container(
//           //   padding: const EdgeInsets.all(10.0),
//           //   width: 150,
//           //   height: 150,
//           //   child: Container(
//           //     decoration: const BoxDecoration(
//           //       image: DecorationImage(
//           //         image: AssetImage("assets/images/bed.jpg"),
//           //         fit: BoxFit.fill,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           const Padding(
//             padding: EdgeInsets.only(left: 10.0, top: 10.0),
//             child: Text(
//               "Latest",
//               style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: (() => Get.off(ProductsView())),
//             child: Image.asset("assets/images/bed.jpg"),
//           ),
//         ],
//       ),
//       // bottomNavigationBar: const NavigationView(),
//     );
//   }

//   Widget displayImageAndText(String imagePath, String text1, String text2,
//       String text3, String text4, String text5) {
//     return Container(
//       decoration:
//           BoxDecoration(border: Border.all(width: 1.0, color: ColorFyp.yellow)),
//       child: Column(
//         children: [
//           Image.asset(imagePath),
//           // Heading of Product or Product title
//           Text(
//             text1,
//             style: const TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           // First bullet point to describe the product
//           ListTile(
//             horizontalTitleGap: -5.0,
//             leading: const CircleAvatar(
//               radius: 8.0,
//               backgroundColor: Colors.green,
//             ),
//             title: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 text2,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(153, 3, 3, 3),
//                 ),
//               ),
//             ),
//           ),
//           // Second bullet point to describe the product
//           ListTile(
//             horizontalTitleGap: -5.0,
//             leading: const CircleAvatar(
//               radius: 8.0,
//               backgroundColor: Colors.green,
//             ),
//             title: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 text3,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(153, 3, 3, 3),
//                 ),
//               ),
//             ),
//           ),
//           // Third bullet point to describe the product
//           ListTile(
//             horizontalTitleGap: -5.0,
//             leading: const CircleAvatar(
//               radius: 8.0,
//               backgroundColor: Colors.green,
//             ),
//             title: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 text4,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(153, 3, 3, 3),
//                 ),
//               ),
//             ),
//           ),
//           // Fourth bullet point to describe the product
//           ListTile(
//             horizontalTitleGap: -5.0,
//             leading: const CircleAvatar(
//               radius: 8.0,
//               backgroundColor: Colors.green,
//             ),
//             title: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 text5,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(153, 3, 3, 3),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget createHorizontalImageList(GestureDetector gestureDetector) {
//   return Container(
//     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//     height: 120,
//     child: ListView.builder(
//       itemCount: 6,
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index){
//       return Container(
//               padding: const EdgeInsets.all(10.0),
//               width: 150,
//               height: 50,
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                   image:AssetImage("assets/images/1.jpg"),
//                   fit: BoxFit.fill,
//                 )),
//                 child: gestureDetector,
//               ));
//     })
//   );
// }

// ----------------- Most selling ------------------------------
// Widget createProductGridView() {
//   final List<Map<String, dynamic>> products = [
//     {
//       'name': 'Product 1',
//       'price': 20.0,
//       'image': 'assets/images/product1.jpg',
//     },
//     {
//       'name': 'Product 2',
//       'price': 30.0,
//       'image': 'assets/images/product2.jpg',
//     },
//     {
//       'name': 'Product 3',
//       'price': 25.0,
//       'image': 'assets/images/product3.jpg',
//     },
//     {
//       'name': 'Product 4',
//       'price': 40.0,
//       'image': 'assets/images/product4.jpg',
//     },
//     {
//       'name': 'Product 5',
//       'price': 15.0,
//       'image': 'assets/images/product5.jpg',
//     },
//     {
//       'name': 'Product 6',
//       'price': 50.0,
//       'image': 'assets/images/product6.jpg',
//     },
//     {
//       'name': 'Product 7',
//       'price': 35.0,
//       'image': 'assets/images/product7.jpg',
//     },
//     {
//       'name': 'Product 8',
//       'price': 45.0,
//       'image': 'assets/images/product8.jpg',
//     },
//     {
//       'name': 'Product 9',
//       'price': 18.0,
//       'image': 'assets/images/product9.jpg',
//     },
//     {
//       'name': 'Product 10',
//       'price': 60.0,
//       'image': 'assets/images/product10.jpg',
//     },
//   ];

//   return GridView.builder(
//     padding: const EdgeInsets.all(8.0),
//     physics: const NeverScrollableScrollPhysics(),
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       childAspectRatio: 0.75,
//       crossAxisSpacing: 8.0,
//       mainAxisSpacing: 8.0,
//     ),
//     itemCount: products.length,
//     itemBuilder: (BuildContext context, int index) {
//       final Map<String, dynamic> product = products[index];

//       return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.white,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     product['image'],
//                     fit: BoxFit.cover,
//                   ),
//                   const Positioned(
//                     top: 8.0,
//                     right: 8.0,
//                     child: Icon(
//                       Icons.favorite_border,
//                       color: Colors.red,
//                       size: 24.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               product['name'],
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               '\$${product['price'].toStringAsFixed(2)}',
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Map<String, dynamic> getItem(int index) {
//   final List<String> imagePaths = [
//     'assets/images/product1.jpg',
//     'assets/images/product2.jpg',
//     'assets/images/product3.jpg',
//     'assets/images/product4.jpg',
//     'assets/images/product5.jpg',
//     'assets/images/product6.jpg',
//     'assets/images/product7.jpg',
//     'assets/images/product8.jpg',
//     'assets/images/product9.jpg',
//     'assets/images/product10.jpg',
//   ];

//   final List<String> names = [
//     'Product 1',
//     'Product 2',
//     'Product 3',
//     'Product 4',
//     'Product 5',
//     'Product 6',
//     'Product 7',
//     'Product 8',
//     'Product 9',
//     'Product 10',
//   ];

//   final List<String> prices = [
//     '\$10',
//     '\$20',
//     '\$30',
//     '\$40',
//     '\$50',
//     '\$60',
//     '\$70',
//     '\$80',
//     '\$90',
//     '\$100',
//   ];

//   final imagePath = imagePaths[index];
//   final name = names[index];
//   final price = prices[index];

//   return {'path': imagePath, 'name': name, 'price': price};
// }

// class Product {
//   final String image;
//   final String name;
//   final double price;

//   const Product({
//     required this.image,
//     required this.name,
//     required this.price,
//   });
// }
