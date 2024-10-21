import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/constant/app_image_constant.dart';
import 'package:amity_nt/amity/app/core/constant/app_textstyle_constant.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_size/flutter_size.dart';

class LoginScreenPage extends StatelessWidget {
  const LoginScreenPage({super.key});
  @override
  Widget build(BuildContext context) {
    var loginScreenController = LoginScreenController.instance;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.96,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  AppImageConstant.appBackgroundImage,
                  height: 360,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: Image.asset(
                    AppImageConstant.appLogo,
                    height: 150,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 322,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Login to access the app',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                              key: loginScreenController.formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextForm(
                                    textInputAction: TextInputAction.next,
                                    validator: (value) => loginScreenController
                                        .validateEmail(value),
                                    controller:
                                        loginScreenController.emailController,
                                    hintText: "Username",
                                    text: "Username",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Obx(
                                    () => CustomTextForm(
                                      textInputAction: TextInputAction.done,
                                      validator: (value) =>
                                          loginScreenController
                                              .validatePassword(value),
                                      controller: loginScreenController
                                          .passwordController,
                                      hintText: "*********",
                                      text: "Password",
                                      obscureText:
                                          loginScreenController.isObscure.value,
                                      icon: IconButton(
                                        icon: Icon(
                                          loginScreenController.isObscure.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          loginScreenController.toggleObscure();
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (loginScreenController
                                          .formkey.currentState!
                                          .validate()) {
                                        loginScreenController
                                            .loginBottonTapped();
                                      }
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF988363),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.forgotPassword);
                                    },
                                    child: const Center(
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
