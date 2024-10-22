import 'package:amity_nt/amity/app/config/theme/app_theme.dart';
import 'package:amity_nt/amity/features/presentation/controller/account_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/splash_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/tab_screen_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(ThemeController());
    Get.lazyPut(() => LoginScreenController());
    // Get.lazyPut(() => DeviceRepository());
    Get.lazyPut(() => ManageJobsController());
    Get.lazyPut(() => TabScreenController());
    // Get.lazyPut(() => ForgotPasswordController());
    // Get.lazyPut(() => AccountScreenController());
  }
}
