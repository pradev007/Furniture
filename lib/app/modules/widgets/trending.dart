import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/controllers/home_controller.dart';

class TrendingTile extends StatelessWidget {
  TrendingTile(
    {Key? key,
      required this.name,
      required this.image,
      required this.onTap,
      required this.productID})
      : super(key: key);

  final String name;
  final String image;
  final VoidCallback onTap;
  final int? productID;

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
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
                                  onTap: onTap,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Get.size.height * 0.2,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
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
                                            Text(name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Obx(
                                              () => IconButton(
                                                  onPressed: () {
                                                    homeController.addFavorites(productID!);
                                                  },
                                                  icon: Icon(
                                                    Icons.favorite,
                                                    color: homeController
                                                            .isFavorite.value
                                                        ? Colors.red
                                                        : Colors
                                                            .blueGrey.shade400,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
  }
}