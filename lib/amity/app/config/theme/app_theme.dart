import 'package:amity_nt/amity/app/core/constant/app_color_constsnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
class ThemeController extends GetxController {
  var isDark = false.obs;


  @override
  void onInit() async {
    super.onInit();

    // isDark = SharedPrefHelper.isDarkTheme();
    // Get.changeThemeMode(ThemeMode.system == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light);

    // ThemeMode.system == ThemeMode.dark ? isDark = true : isDark = false;
    // update();

    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    //  isDark.value = brightness == Brightness.dark;
     Get.changeThemeMode(brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
    //  update();
     

  }

  void changeTheme(bool _isDark) async {
    isDark.value = _isDark;
    // await SharedPrefHelper.cacheTheme(_isDark);
    Get.changeThemeMode(_isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}


class Themes {
  static final light = ThemeData(
  //   primarySwatch: Colors.blue,
  // visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  //   primaryColor: Colors.green,
    scaffoldBackgroundColor: lightScaffoldBgColor,
    // fontFamily: 'Georgia',
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    // ),
  );

  static final dark = ThemeData(
    brightness: Brightness.light,
    // primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: darkScaffoldBgColor,
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    // ),
  );
}