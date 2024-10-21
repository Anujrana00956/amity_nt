

import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/domain/use_cases/screen_usecase/screen_usecase.dart';
import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:amity_nt/amity/features/presentation/pages/manage_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TabScreenController extends GetxController {
  
  final ScreenUsecase _screenUsecase = ScreenUsecase();

  var selectedIndex = 0;

  final List<Widget> screens = [
    const ManageJobsPage(),
    // const JobDetailInactiveScreenPage(),
    // const NotificationsScreenPage(),
    // const AccountScreenPage(),
  ];

  Future<void> changeTab(int index) async {
    var response = await _screenUsecase.getUserProfile(isLoading: true);
    if (response.status == true) {
      selectedIndex = index;

      switch (selectedIndex) {
        case 0:
          Get.find<ManageJobsController>().startDate.value = 'From date';
          Get.find<ManageJobsController>().endDate.value = 'End date';
          Get.find<ManageJobsController>().selectedStartDate =
              Get.find<ManageJobsController>().refreceStartDate;
          Get.find<ManageJobsController>().selectedEndDate =
              Get.find<ManageJobsController>().refreceEndDate;
          Get.find<ManageJobsController>().update();
          Get.find<ManageJobsController>().manageJobs(isLoading: false);
          break;
        case 1:
        Utility.showLoader();
          // Get.find<NotificationsScreenController>()
          //     .getNotification(isLoading: false);
          // Utility.showLoader();
          // Get.find<NotificationsScreenController>()
          //     .rejectedJobs(isLoading: false);

          Utility.closeLoader();
          break;
        case 2:
          Get.find<ManageJobsController>().getDropDownData();
          Utility.closeLoader();
          break;
      }
      Utility.closeLoader();
    } else {
      selectedIndex = 2;
      Utility.closeLoader();
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    changeTab(selectedIndex);

    Get.find<ManageJobsController>().getDropDownData();
  }
}
