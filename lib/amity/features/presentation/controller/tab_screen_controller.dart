import 'dart:isolate';

import 'package:amity_nt/amity/features/domain/repositories/repo.dart';
import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:get/get.dart';

class TabScreenController extends GetxController {
  final _repositor = Repository();
  var selectedIndex = 0;

  // final List<Widget> screens = [
  //   const ManageJobsPage(),
  //   // const JobDetailInactiveScreenPage(),
  //   // const NotificationsScreenPage(),
  //   const AccountScreenPage(),
  // ];

  Future<void> changeTab(int index) async {
    await _repositor.getUserProfile(isLoading: true);
    Get.lazyPut(() => ManageJobsController());
    selectedIndex = index;

    update();
  }

  @override
  void onInit() {
    super.onInit();
    changeTab(selectedIndex);
    Get.lazyPut(() => ManageJobsController());
    Get.find<ManageJobsController>().Isolatecalling();
  }
}
