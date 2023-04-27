import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'app/routes/app_pages.dart';
import 'package:khalti/khalti.dart';

void main() {
  runApp(
    const FurnitureApp(),
  );
}

class FurnitureApp extends StatelessWidget {
  const FurnitureApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_c428dd09742b4086a28d882da234f20a",
        enabledDebugging: true,
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        });
  }
}
