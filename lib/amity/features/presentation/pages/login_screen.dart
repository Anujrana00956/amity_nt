import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/constant/app_image_constant.dart';
import 'package:amity_nt/amity/app/core/constant/app_textstyle_constant.dart';
import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
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
                  height: context.deviceHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    AppImageConstant.appLogo,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 200,
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Login to access the app',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          const Text(
                            'Username',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 1.5,
                          ),
                          TextFormField(
                            validator: 'Username'.fieldValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: loginScreenController.emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: loginScreenController
                                          .emailError.isNotEmpty
                                      ? Colors.red
                                      : const Color(0xFFC7C7C8),
                                  width: 1,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              hintText: "Username",
                              hintStyle: const TextStyle(
                                color: Color(0xFFC7C7C8),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: loginScreenController.validateEmail,
                            // textInputAction: TextInputAction.next,
                          ),
                          if (loginScreenController.emailError.isNotEmpty)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 1.5,
                                ),
                                Text(
                                  loginScreenController.emailError.value,
                                  style: AppTextstyleConstant.red_10_600,
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 1.5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: loginScreenController
                                        .passwordError.isNotEmpty
                                    ? Colors.red
                                    : const Color(0xFFC7C7C8),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              obscureText:
                                  loginScreenController.isObscure.value,
                              controller:
                                  loginScreenController.passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  top: 12,
                                  left: 10,
                                ),
                                hintText: "**********",
                                hintStyle: const TextStyle(
                                  color: Color(0xFFC7C7C8),
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: IconButton(
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
                              onChanged: loginScreenController.validatePassword,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          if (loginScreenController.passwordError.isNotEmpty)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 1.5,
                                ),
                                Text(
                                  loginScreenController.passwordError.value,
                                  style: AppTextstyleConstant.red_10_600,
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          GestureDetector(
                            onTap: () {
                              bool isValid =
                                  loginScreenController.validateLogin();
                              if (isValid) {
                                loginScreenController.loginBottonTapped();
                              }
                            },
                            child: Container(
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xFF988363),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
