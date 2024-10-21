import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:amity_nt/amity/features/presentation/widgets/manage_job_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ManageJobsPage extends GetView<ManageJobsController> {
  const ManageJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManageJobsController>(builder: (manageJobsController) {
      return Scaffold(
        // backgroundColor: const Color(0xFFFEFBF5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manage Jobs',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.jobCalendarScreen);
                        },
                        child: Image.asset(
                          'assets/images/screen_image/Vectorr.png',
                          scale: 2.7,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Select Date Range',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 12,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          manageJobsController.selectDate(context, true);
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFFC7C7C8),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                manageJobsController.startDate.value,
                                style: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image.asset(
                                'assets/images/screen_image/Vectorr.png',
                                height: 4,
                                width: 4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.update();
                          manageJobsController.selectDate(context, false);
                        },
                        child: Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFFC7C7C8),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                manageJobsController.endDate.value,
                                style: const TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image.asset(
                                'assets/images/screen_image/Vectorr.png',
                                height: 4,
                                width: 4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                controller.manageJobsErrorText.isNotEmpty
                    ? GestureDetector(
                        onVerticalDragDown: (details) async {
                          manageJobsController.manageJobs(isLoading: true);
                          manageJobsController.startDate.value = 'From date';
                          manageJobsController.endDate.value = 'End date';
                          manageJobsController.update();
                        },
                        child: Container(
                            color: const Color(0xFFFEFBF5),
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.of(context).size.height / 2.2,
                            child: Text(controller.manageJobsErrorText)),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            manageJobsController.manageJobs(isLoading: false);
                            manageJobsController.startDate.value = 'From date';
                            manageJobsController.endDate.value = 'End date';
                            manageJobsController.update();
                          },
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 2,
                              ),
                              Column(
                                children: [
                                  for (var val in controller.manageJobsList)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: ManageJobsWidget(
                                        jobname: val.jobName,
                                        client: val.clientName,
                                        status: val.status,
                                        onTap: () {
                                          Get.toNamed(
                                              Routes.jobDetailInactiveScreen,
                                              arguments: {
                                                'detailData': val,
                                                'buttons': false,
                                              });
                                        },
                                        attendanceTap: () {
                                          Get.toNamed(
                                              Routes.dailyAttendanceScreen,
                                              arguments: {
                                                'jobId': val.id,
                                                'clientName': val.clientName,
                                                'serviceType': val.serviceType,
                                              });
                                        },
                                        attendanceHistory: () {
                                          Get.toNamed(
                                              Routes.viewAttendanceScreen,
                                              arguments: {
                                                'jobId': val.id,
                                              });
                                        },
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 1.5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
