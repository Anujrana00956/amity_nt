import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/app/global_constant.dart';
import 'package:amity_nt/amity/features/domain/repositories/repo.dart';
import 'package:amity_nt/amity/features/domain/use_cases/auth_case/auth_case.dart';
import 'package:amity_nt/amity/features/presentation/controller/tab_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get instance => Get.find();
  final _authCase = AuthCase();
  final _repository = Repository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();
  // Password Visibilty
  var isObscure = true.obs;
  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
  }

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

  // Password Validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password can\'t be blank';
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }

    return null;
  }

  // Login Button Validation

  // Login API
  loginBottonTapped() async {
    await _repository.authLogin(
      email: emailController.text,
      password: passwordController.text,
      deviceToken: AppConstants.fcmToken.isEmpty ? '' : AppConstants.fcmToken,
    );
  }
}
