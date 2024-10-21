import 'package:amity_nt/amity/app/config/router/route_manager.dart';
import 'package:amity_nt/amity/app/config/theme/app_theme.dart';
import 'package:amity_nt/amity/app/core/bindings/splashBinding.dart';
import 'package:amity_nt/amity/features/presentation/pages/manage_job_screen.dart';
import 'package:amity_nt/amity/features/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<dynamic>('Amity');
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.amberAccent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ThemeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Amity",
      initialBinding: Splashbinding(),
      home: const SplashScreen(),
      getPages: AppPages.pages,
      themeMode: controller.isDark.isTrue ? ThemeMode.dark : ThemeMode.light,
      darkTheme: Themes.dark,
    );
  }
}
