import 'package:amity_nt/amity/app/core/constant/app_image_constant.dart';
import 'package:amity_nt/amity/features/presentation/controller/forgot_password_controller.dart';
import 'package:amity_nt/amity/features/presentation/pages/login_screen.dart';
import 'package:amity_nt/amity/features/presentation/widgets/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_size/flutter_size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var forgotController = Get.put(ForgotPasswordController());
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
                  left: 35,
                  top: 48,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 27,
                          ),
                          Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 315,
                  child: Container(
                    height: context.deviceHeight,
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
                          horizontal: 30, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Forgot Your Password',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Form(
                              key: forgotController.forgotFormKey,
                              child: CustomTextForm(
                                  controller: forgotController.emailController,
                                  hintText: "Username",
                                  text: "Username",
                                  validator: (value) =>
                                      forgotController.validateEmail(value),
                                  textInputAction: TextInputAction.done)),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (forgotController.forgotFormKey.currentState!
                                  .validate()) {
                                forgotController.sendOtpForForgot();
                              }
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF988363),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  'Send Otp',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
