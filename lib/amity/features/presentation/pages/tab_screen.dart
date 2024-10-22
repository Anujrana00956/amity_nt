import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/tab_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/pages/account_screen.dart';
import 'package:amity_nt/amity/features/presentation/pages/manage_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TabScreenPage extends StatelessWidget {
  const TabScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabScreenController>(builder: (tabScreenController) {
      return Scaffold(
        backgroundColor: const Color(0xFFFEFBF5),
        body: IndexedStack(
          index: tabScreenController.selectedIndex,
          children: const [
            ManageJobsPage(),
            // NotificationsScreenPage(),
            AccountScreenPage(),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              currentIndex: tabScreenController.selectedIndex,
              onTap: tabScreenController.changeTab,
              items: const <BottomNavigationBarItem>[
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.home),
                //   label: 'Home',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  label: 'Jobs',
                ),
                // BottomNavigationBarItem(
                //   icon: Get.find<NotificationsScreenController>()
                //           .unreadNotificationId
                //           .isEmpty
                //       ? const Icon(Icons.notifications)
                //       : Badge(
                //           label: Text(Get.find<NotificationsScreenController>()
                //               .unreadNotificationId
                //               .length
                //               .toString()),
                //           child: const Icon(Icons.notifications)),
                //   label: 'Notifications',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.manage_accounts),
                  label: 'Account',
                ),
              ],
              selectedItemColor: const Color(0xFF867150),
              unselectedItemColor: const Color(0xFF7A7A7A),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(
                color: Color(0xFF867150),
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Color(0xFF7A7A7A),
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      );
    });
  }
}
