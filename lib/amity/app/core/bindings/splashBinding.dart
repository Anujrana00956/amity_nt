import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/splash_screen_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.lazyPut(() => LoginScreenController());
  }
}
