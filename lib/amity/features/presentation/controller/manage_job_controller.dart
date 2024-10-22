import 'dart:isolate';

import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/utils/extensions/extensions.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/features/domain/entities/models/job_list_response.dart';
import 'package:amity_nt/amity/features/domain/repositories/repo.dart';
import 'package:amity_nt/amity/features/domain/use_cases/screen_usecase/screen_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class ManageJobsController extends GetxController {
  // ManageJobsController(this._manageJobsPresenter);
  // final ManageJobsPresenter _manageJobsPresenter;
  // ManageJobsController get instance => Get.find();

  final _repository = Repository();
  RxString startDate = 'From date'.obs;
  RxString endDate = 'End date'.obs;

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  DateTime? refreceStartDate;
  DateTime? refreceEndDate;
  // var controller = Get.put(AppUpdaterProvider());

  void setStartDate(String date) {
    startDate.value = date;
    update();
    if (endDate.isNotEmpty) {
      if (selectedEndDate!.isAfter(selectedStartDate!) ||
          selectedEndDate!.isAtSameMomentAs(selectedStartDate!)) {
        /// Api of manage jobs
        DateTime newStartDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
            .parse('$selectedStartDate 00:00:00.000');
        DateTime newEndDate = DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
            .parse('$selectedEndDate 23:59:59.000');
        manageJobs(
            fromDate: newStartDate.toUtc().toString(),
            toDate: newEndDate.toUtc().toString().toString());
      } else {
        Utility.showMessage('End date should be greater than start date',
            MessageType.error, () => Get.back(), 'OK');
      }
    }
  }

  void setEndDate(String date) {
    endDate.value = date;
    update();
    if (startDate.isNotEmpty) {
      if (selectedEndDate!.isAfter(selectedStartDate!) ||
          selectedEndDate!.isAtSameMomentAs(selectedStartDate!)) {
        /// Api of manage jobs
        String newStartDate =
            "${DateFormat('yyyy-MM-dd').format(selectedStartDate!)} 00:00:00";
        String newEndDate =
            "${DateFormat('yyyy-MM-dd').format(selectedEndDate!)} 23:59:59";
        print('new start date==>$newStartDate');
        print('new end date==>$newEndDate');
        manageJobs(
            fromDate: DateTime.parse(newStartDate).toUtc().toString(),
            toDate: DateTime.parse(newEndDate).toUtc().toString().toString());
      } else {
        Utility.showMessage('End date should be greater than start date',
            MessageType.error, () => Get.back(), 'OK');
      }
    }
  }

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    DateTime currentDate = isStartDate
        ? selectedStartDate ?? DateTime.now()
        : selectedEndDate ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final formattedDate = DateFormat('MMM d, yyyy').format(picked);
      if (isStartDate) {
        selectedStartDate = picked;
        setStartDate(formattedDate);
        print('end date -----$selectedStartDate');
      } else {
        selectedEndDate = picked;
        setEndDate(formattedDate);
        print('end date -----$selectedEndDate');
      }
    }
  }

  String dateFormatter(String date) {
    final finalDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
    return finalDate;
  }

  /// Using the same model class because data will be same
  List<NotificationList> manageJobsList = [];
  String manageJobsErrorText = '';

  Future<void> getUserProfile() async {
    await _repository.getUserProfile(isLoading: false);
  }

// Get DropDown API
  void getDropDownData(SendPort sendport) async {
    await _repository.getDropdown();
  }

  Future<void> Isolatecalling() async {
    final ReceivePort receivePort = ReceivePort();

    Isolate.spawn(getDropDownData, receivePort.sendPort);
    var anuj = await receivePort.first;
    "$anuj this is a isolate".logPrint;
  }
  // Future<void> isolatecalling() async {
  //   final ReceivePort receivePort = ReceivePort();

  //   Isolate.spawn(getUserProfile, receivePort.sendPort);
  //   var anuj = await receivePort.first;
  //   "$anuj this is a isolate".logPrint;
  // }

  /// Manage jobs api accepted
  Future<void> manageJobs({
    bool isLoading = true,
    String status = 'Accepted',
    String fromDate = '',
    String toDate = '',
  }) async {
    manageJobsList.clear();
    manageJobsErrorText = '';
    await _repository.manageJobs(
      fromDate: fromDate,
      toDate: toDate,
      isLoading: isLoading,
      status: status,
    );

    update();
  }
}
