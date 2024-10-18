import 'package:amity_nt/amity/app/core/constant/app_image_constant.dart';
import 'package:amity_nt/amity/features/presentation/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImageConstant.appBackgroundImage))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset(
              AppImageConstant.appLogo,
              scale: 4,
            ),
          ),
        ),
      ),
    );
  }
}
