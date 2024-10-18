import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/app/global_constant.dart';
import 'package:amity_nt/amity/features/domain/use_cases/auth_case/auth_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get instance => Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Password Visibilty
  var isObscure = true.obs;
  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
  }

  var passwordError = RxString('');
  var emailError = RxString('');

  // Email Validation
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Username can\'t be blank';
    } else {
      emailError.value = '';
    }
    update();
  }

  // Password Validation
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password can\'t be blank';
    } else if (value.length < 8) {
      passwordError.value = 'Password should be at least 8 characters';
    } else {
      passwordError.value = '';
    }
    update();
  }

  // Login Button Validation
  bool validateLogin() {
    bool isValid = true;

    if (emailController.text.isEmpty) {
      emailError.value = 'Username can\'t be blank';
      passwordError.value = '';
      isValid = false;
      update();
      return isValid;
    }
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password can\'t be blank';
      isValid = false;
      update();
      return isValid;
    }

    if (passwordController.text.length < 8) {
      passwordError.value = 'Password should be at least 8 characters';
      isValid = false;
      update();
      return isValid;
    }
    update();
    return isValid;
  }

  // Login API
  loginBottonTapped() async {
    var response = await AuthCase.authLogin(
      email: emailController.text,
      password: passwordController.text,
      deviceToken: AppConstants.fcmToken.isEmpty ? '' : AppConstants.fcmToken,
    );

    if (response.status == true) {
      Get.offNamed(Routes.tabScreen);
      // Get.find<TabScreenController>().changeTab(0);
    } else {
      Utility.showToast('Invalid Username or Password');
    }
  }
}
