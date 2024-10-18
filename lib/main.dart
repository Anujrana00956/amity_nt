import 'package:amity_nt/amity/app/config/router/route_manager.dart';
import 'package:amity_nt/amity/app/core/bindings/splashBinding.dart';
import 'package:amity_nt/amity/features/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amity",
      initialBinding: Splashbinding(),
      home: const SplashScreen(),
      getPages: AppPages.pages,
    );
  }
}
