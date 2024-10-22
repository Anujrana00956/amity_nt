import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/constant/app_color_constsnt.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/presentation/controller/account_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/widgets/PopupMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AccountScreenPage extends GetView<AccountScreenController> {
  const AccountScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountScreenController>(
        builder: (accountScreenController) {
      return Scaffold(
        // backgroundColor:
        //     Get.isDarkMode ? darkScaffoldBgColor : lightScaffoldBgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Account',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 35,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 17),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.editProfileScreen);
                  },
                  child: const AccountScreenData(
                    text: 'Edit Profile',
                    image: 'assets/images/screen_image/Vector.png',
                    isShowButton: true,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.availabilityScreen);
                    },
                    child: const AccountScreenData(
                        text: "Availability",
                        isShowButton: true,
                        image:
                            "assets/images/screen_image/clock-seven-svgrepo-com 1.png")),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                    onTap: () {
                      Utility.closeLoader();
                      controller.uploadDocOnWeb();
                    },
                    child: const AccountScreenData(
                        text: "Paperwork",
                        isShowButton: true,
                        image:
                            "assets/images/screen_image/paperwork_icon.png")),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.changePasswordScreen);
                    },
                    child: const AccountScreenData(
                        text: "Change Password",
                        isShowButton: true,
                        image: "assets/images/screen_image/Vector2.png")),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                    onTap: () {
                      // Get.to(SupportScreenPage(),
                      //     transition: Transition.rightToLeft);

                      Get.toNamed(Routes.supportScreen);
                    },
                    child: const AccountScreenData(
                        text: "Support",
                        image: "assets/images/screen_image/Page-1.png")),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                    onTap: () {
                      Get.dialog(
                        PopupMessageWidget(
                          title: 'Logout',
                          subtitle: 'Are you sure you want to logout ?',
                          okText: 'Logout',
                          onTap: () async {
                            await accountScreenController.logoutBottonTapped();
                          },
                        ),
                      );
                    },
                    child: const AccountScreenData(
                      text: "Logout",
                      image:
                          "assets/images/screen_image/logout-line-svgrepo-com 2.png",
                      isShowButton: false,
                    )),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "v${snapshot.data?.version ?? ''}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class AccountScreenData extends StatelessWidget {
  const AccountScreenData({
    super.key,
    required this.text,
    required this.image,
    this.isShowButton = false,
  });
  final String text, image;
  final bool isShowButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFC7C7C8),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF867150),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  image,
                  scale: 2.8,
                ),
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            (isShowButton)
                ? Image.asset(
                    "assets/images/screen_image/Arrow 2.png",
                    scale: 2.5,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
