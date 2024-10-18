import 'package:amity_nt/amity/app/core/constant/local_key_constant.dart';
import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreenController extends GetxController {
  void navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(Routes.loginScreen);
      // var userToken =
      //     Get.find<DeviceRepository>().getStringValue(LocalKeys.authToken);

      // userToken.isEmpty
      //     ? Get.offAllNamed(Routes.loginScreen)
      //     : Get.offAllNamed(Routes.tabScreen);
    });
  }

  @override
  void onInit() {
    super.onInit();

    navigateToNextScreen();
  }
}
