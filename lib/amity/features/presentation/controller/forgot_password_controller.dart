import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/domain/device_repo.dart';
import 'package:amity_nt/amity/features/domain/use_cases/auth_case/auth_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  var emailError = RxString('');
  var forgotFormKey = GlobalKey<FormState>();
  // Email Validation
  String? validateEmail(String? value) {
    // final emailRegExp =
    //     RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'Username can\'t be blank';
    }

    update();
    return null;
  }

  // Login Button Validation
  bool validateForgot() {
    bool isValid = true;

    if (emailController.text.isEmpty) {
      emailError.value = 'Username can\'t be blank';

      isValid = false;
      update();
      return isValid;
    }

    update();
    return isValid;
  }

  String currentScreen = 'Login';
 // Forgot Password API
  Future<void> sendOtpForForgot() async {
    Get.find<DeviceRepository>().saveValue('email', emailController.text);
    var response = await AuthCase.sendOtp(
        email: Get.find<DeviceRepository>().getStringValue('email').toString(),
        isLoading: true);
    print('status is  ${response.data}');
    if (!response.hasError) {
      Utility.showToast(response.message);
      if (currentScreen == 'Login') {
        // Get.to(ResetPasswordPage());
      }
    }
  }
}
