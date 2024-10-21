import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/constant/local_key_constant.dart';
import 'package:amity_nt/amity/app/core/utils/utility.dart';
import 'package:amity_nt/amity/app/global_constant.dart';
import 'package:amity_nt/amity/features/data/repositories/data_repo.dart';
import 'package:amity_nt/amity/features/domain/device_repo.dart';
import 'package:amity_nt/amity/features/domain/entities/models/dropdown_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/get_profile_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/job_list_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/login_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:amity_nt/amity/features/presentation/controller/tab_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Repository {
  final DeviceRepository  _deviceRepository=DeviceRepository();
  final DataRepository  _dataRepository=DataRepository();
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
  static Future<LoginResponse> authLogin(
      {required String email,
      required String password,
      required String deviceToken}) async {
    LoginResponse? loginResponse;
    return loginResponse!;
  }
  // Future<ResponseModel> logout() async {
  //    LoginResponse? loginResponse;
  //   return !;
  // }

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

   static Future<DropDownResponse> getDropdown() async {
    try {
      var response = await DataRepository.getDropdown();
      DropDownResponse? dropDownResponse;
      if (!response.hasError) {
        dropDownResponse = dropDownResponseFromJson(response.data);
        AppConstants.liscenseItems = dropDownResponse.licenses;
        AppConstants.serviceItems = dropDownResponse.services;
        AppConstants.visitItems = dropDownResponse.visitTypes;
        AppConstants.reasonItems = dropDownResponse.reason;
      } else {
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }
      return dropDownResponse!;
    } catch (e) {
      return await DeviceRepository.getDropdown();
    }
  }


 Future<GetUserProfileResponse> getUserProfile({
    required bool isLoading,
  }) async {
    var token = getStringValue(LocalKeys.authToken);
    try {
      var response = await DataRepository.getUserProfile(
        isLoading: isLoading,
        token: token,
      );
      GetUserProfileResponse? getUserProfileResponse;
      if (!response.hasError) {
        getUserProfileResponse = getUserProfileResponseFromJson(response.data);
        saveValue(LocalKeys.userId, getUserProfileResponse.userId);
        saveValue(LocalKeys.userName, getUserProfileResponse.userName);
        saveValue(LocalKeys.userRadius, getUserProfileResponse.userRadius);
        saveValue(LocalKeys.userPhone, getUserProfileResponse.userPhone);
        saveValue(LocalKeys.userEmail, getUserProfileResponse.userEmail);
        saveValue(LocalKeys.userLocation, getUserProfileResponse.userLocation);
        saveValue(LocalKeys.userLiscenseId,
            getUserProfileResponse.liscenseId.toString());
        saveValue(
            LocalKeys.userLiscenseName, getUserProfileResponse.liscenseName);
        saveValue(LocalKeys.userServiceId,
            getUserProfileResponse.serviceId.toString());
        saveValue(
            LocalKeys.userServiceName, getUserProfileResponse.serviceName);

        saveValue(LocalKeys.userSignature, getUserProfileResponse.signature);

        saveValue(LocalKeys.userLongitude, getUserProfileResponse.longitude);
        saveValue(LocalKeys.userLatitude, getUserProfileResponse.latitude);
      } else {
        getUserProfileResponse = getUserProfileResponseFromJson(response.data);
        saveValue(LocalKeys.userId, getUserProfileResponse.userId);
        saveValue(LocalKeys.userName, getUserProfileResponse.userName);
        saveValue(LocalKeys.userRadius, getUserProfileResponse.userRadius);
        saveValue(LocalKeys.userPhone, getUserProfileResponse.userPhone);
        saveValue(LocalKeys.userEmail, getUserProfileResponse.userEmail);
        saveValue(LocalKeys.userLocation, getUserProfileResponse.userLocation);
        saveValue(LocalKeys.userLiscenseId,
            getUserProfileResponse.liscenseId.toString());
        saveValue(
            LocalKeys.userLiscenseName, getUserProfileResponse.liscenseName);
        saveValue(LocalKeys.userServiceId,
            getUserProfileResponse.serviceId.toString());
        saveValue(
            LocalKeys.userServiceName, getUserProfileResponse.serviceName);

        saveValue(LocalKeys.userSignature, getUserProfileResponse.signature);

        saveValue(LocalKeys.userLongitude, getUserProfileResponse.longitude);
        saveValue(LocalKeys.userLatitude, getUserProfileResponse.latitude);
        Utility.closeDialog();
        Get.find<TabScreenController>().selectedIndex = 2;
        Get.find<TabScreenController>().update();
        Utility.showToast(response.message);
        // Utility.showMessage(
        //     response.message, MessageType.error, () => Get.back(), 'ok');
      }
      return getUserProfileResponse;
    } catch (e) {
      return await _deviceRepository.getUserProfile(
        isLoading: isLoading,
        token: token,
      );
    }
  }
   Future<JobListResponse> manageJobs({
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) async {
    var token = getStringValue(LocalKeys.authToken);
    try {
      var response = await _dataRepository.manageJobs(
        fromDate: fromDate,
        toDate: toDate,
        token: token,
        isLoading: isLoading,
        status: status,
      );
      JobListResponse? jobListResponse;
      if (!response.hasError) {
        jobListResponse = jobListResponseFromJson(response.data);
      } else {
        Utility.closeDialog();
        Utility.showMessage(
            response.message, MessageType.error, () => Get.back(), 'ok');
      }
      return jobListResponse!;
    } catch (e) {
      return await _deviceRepository.manageJobs(
        fromDate: fromDate,
        toDate: toDate,
        token: token,
        isLoading: isLoading,
        status: status,
      );
    }
  }

}
