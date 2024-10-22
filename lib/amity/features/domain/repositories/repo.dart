import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/constant/local_key_constant.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/app/global_constant.dart';
import 'package:amity_nt/amity/features/data/data_sources/local/hive_manager.dart';
import 'package:amity_nt/amity/features/data/data_sources/remote/connect_helper.dart';
import 'package:amity_nt/amity/features/data/repositories/data_repo.dart';
import 'package:amity_nt/amity/features/domain/device_repo.dart';
import 'package:amity_nt/amity/features/domain/entities/models/dropdown_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/get_profile_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/get_web_logintoken_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/job_list_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/login_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:amity_nt/amity/features/presentation/controller/account_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/login_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/manage_job_controller.dart';
import 'package:amity_nt/amity/features/presentation/controller/tab_screen_controller.dart';
import 'package:amity_nt/amity/features/presentation/pages/login_screen.dart';
import 'package:amity_nt/amity/features/presentation/widgets/SupportPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Repository {
  final DeviceRepository _deviceRepository = DeviceRepository();
  final DataRepository _dataRepository = DataRepository();
  final _hivemnager = HiveManager();
  final _connectHelper = ConnectHelper();
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(
        key,
        value,
      );
    } catch (e) {
      print(e.toString());
      _dataRepository.saveValue(
        key,
        value,
      );
    }
  }

  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(
        key,
      );
    } catch (_) {
      return _dataRepository.getStringValue(
        key,
      );
    }
  }

  // login api calling and handle the error message here
  Future<void> authLogin(
      {required String email,
      required String password,
      required String deviceToken}) async {
    try {
      var response = await ConnectHelper.authLogin(
        email: email,
        password: password,
        deviceToken: deviceToken,
      );
      if (!response.hasError) {
        var loginResponse = loginResponseFromJson(response.data);
        _hivemnager.saveValue(LocalKeys.authToken, loginResponse.token);
        _hivemnager.saveValue(LocalKeys.userSignature, loginResponse.signature);
        _hivemnager.saveValue(LocalKeys.userEmail, loginResponse.userEmail);

        Get.put(ManageJobsController());
        Get.offNamed(Routes.tabScreen);
        Get.put(TabScreenController());
        Get.find<TabScreenController>().changeTab(0);
        // Get.lazyPut(() => ForgotPasswordController());
        Get.lazyPut(() => AccountScreenController());
      } else {
        Utility.showToast('Invalid Username or Password');
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }
    } catch (e) {
      debugPrint('Login Api Exception in respositry==========>> $e');
    }
  }

  Future<void> logout() async {
    var response = await _connectHelper.logout();
    if (!response.hasError) {
      _hivemnager.clearBox();

      Get.lazyPut(() => LoginScreenController());
      Get.offAll(const LoginScreenPage());
      // Get.lazyPut(() => DeviceRepository());
    } else {
      Utility.showToast('Something went wrong');
    }
  }

  static Future<ResponseModel> sendOtp(
      {required String email, required bool isLoading}) async {
    try {
      var response = await DataRepository.sendOtp(
        email: email,
        isLoading: isLoading,
      );
      if (response.hasError) {
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }

      return ResponseModel(
          data: response.data,
          hasError: response.hasError,
          errorCode: response.errorCode,
          message: response.message);
    } catch (e) {
      print('now the exception is $e');
      return await DeviceRepository.sendOtp(
        email: email,
        isLoading: isLoading,
      );
    }
  }

  Future<void> getDropdown() async {
    try {
      var response = await _connectHelper.getDropdown();
      if (!response.hasError) {
        var dropDownResponse = dropDownResponseFromJson(response.data);
        AppConstants.liscenseItems = dropDownResponse.licenses;
        AppConstants.serviceItems = dropDownResponse.services;
        AppConstants.visitItems = dropDownResponse.visitTypes;
        AppConstants.reasonItems = dropDownResponse.reason;
      } else {
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getUserProfile({
    required bool isLoading,
  }) async {
    var token = getStringValue(LocalKeys.authToken);
    try {
      var response = await ConnectHelper.getUserProfile(
        isLoading: isLoading,
        token: token,
      );

      if (!response.hasError) {
        var getUserProfileResponse =
            getUserProfileResponseFromJson(response.data);
        _hivemnager.saveAllValue({
          LocalKeys.userId: getUserProfileResponse.userId,
          LocalKeys.userName: getUserProfileResponse.userName,
          LocalKeys.userRadius: getUserProfileResponse.userRadius,
          LocalKeys.userPhone: getUserProfileResponse.userPhone,
          LocalKeys.userEmail: getUserProfileResponse.userEmail,
          LocalKeys.userLocation: getUserProfileResponse.userLocation,
          LocalKeys.userLiscenseId:
              getUserProfileResponse.liscenseId.toString(),
          LocalKeys.userLiscenseName: getUserProfileResponse.liscenseName,
          LocalKeys.userServiceId: getUserProfileResponse.serviceId.toString(),
          LocalKeys.userServiceName: getUserProfileResponse.serviceName,
          LocalKeys.userSignature: getUserProfileResponse.signature,
          LocalKeys.userLongitude: getUserProfileResponse.longitude,
          LocalKeys.userLatitude: getUserProfileResponse.latitude,
        });
        // Get.find<TabScreenController>().selectedIndex;
        Get.lazyPut(() => TabScreenController());
        Get.lazyPut(() => ManageJobsController());
        switch (Get.find<TabScreenController>().selectedIndex) {
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
          
            Get.find<ManageJobsController>().Isolatecalling();
            Utility.closeLoader();
            break;
        }
      } else {
        var getUserProfileResponse =
            getUserProfileResponseFromJson(response.data);
        _hivemnager.saveAllValue({
          LocalKeys.userId: getUserProfileResponse.userId,
          LocalKeys.userName: getUserProfileResponse.userName,
          LocalKeys.userRadius: getUserProfileResponse.userRadius,
          LocalKeys.userPhone: getUserProfileResponse.userPhone,
          LocalKeys.userEmail: getUserProfileResponse.userEmail,
          LocalKeys.userLocation: getUserProfileResponse.userLocation,
          LocalKeys.userLiscenseId:
              getUserProfileResponse.liscenseId.toString(),
          LocalKeys.userLiscenseName: getUserProfileResponse.liscenseName,
          LocalKeys.userServiceId: getUserProfileResponse.serviceId.toString(),
          LocalKeys.userServiceName: getUserProfileResponse.serviceName,
          LocalKeys.userSignature: getUserProfileResponse.signature,
          LocalKeys.userLongitude: getUserProfileResponse.longitude,
          LocalKeys.userLatitude: getUserProfileResponse.latitude,
        });
        Utility.closeDialog();
        Get.find<TabScreenController>().selectedIndex = 2;
        Get.find<TabScreenController>().update();
        Utility.showToast(response.message);
        // Utility.showMessage(
        //     response.message, MessageType.error, () => Get.back(), 'ok');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> manageJobs({
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) async {
    var token = getStringValue(LocalKeys.authToken);
    try {
      var response = await ConnectHelper.manageJobs(
        fromDate: fromDate,
        toDate: toDate,
        token: token,
        isLoading: isLoading,
        status: status,
      );
      if (!response.hasError) {
        var jobListResponse = jobListResponseFromJson(response.data);
        if (jobListResponse.notificationList.isNotEmpty) {
          Get.lazyPut(() => ManageJobsController());
          Get.find<ManageJobsController>().manageJobsList =
              jobListResponse.notificationList;
        } else {
          Get.find<ManageJobsController>().manageJobsErrorText =
              'No jobs applied yet';
        }
      } else {
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }
    } catch (e) {
      debugPrint(
          'This is a Manage Job Exception in Repository===========>>>>>>>>>> $e');
    }
  }

  Future<void> getWebLoginToken({
    required bool isLoading,
  }) async {
    var token = getStringValue(LocalKeys.authToken);
    try {
      var response = await ConnectHelper.getWebLoginToken(
        token: token,
        isLoading: isLoading,
      );

      if (!response.hasError) {
        var getWebLoginTokenResponse =
            getWebLoginTokenResponseFromJson(response.data);
        Utility.closeLoader();
        String url = 'https://tagstaff.us/login/using-web-token?'
            'email=${_hivemnager.getStringValue(LocalKeys.userEmail)}'
            '&web_login_token=${Uri.encodeComponent(getWebLoginTokenResponse.webLoginToken)}';

        Get.to(() => WebViewPage(url: url));
      }
    } catch (e) {
      return await _deviceRepository.getWebLoginToken(
        token: token,
        isLoading: isLoading,
      );
    }
  }
}
