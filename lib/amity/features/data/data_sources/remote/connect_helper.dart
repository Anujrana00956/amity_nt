import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/features/data/data_constant.dart';
import 'package:amity_nt/amity/features/data/data_sources/remote/api_request.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:flutter/material.dart';

class ConnectHelper {
  // Login Api
  static Future<ResponseModel> authLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    var data = {
      'username': email.toString(),
      'password': password.toString(),
      "device_token": deviceToken,
    };
    debugPrint('the conneect with error $email =>>$password');
    return await ApiRequest.makeRequest(
      url: 'login?include_nurse=true',
      isLoading: true,
      data: data,
      request: MethodRequest.post,
    );
  }

// LogOut Api
  static Future<ResponseModel> logout() async {
    return await ApiRequest.makeRequest(
        request: MethodRequest.post,
        url: 'logout',
        isLoading: true,
        headers: {
          'Accept': 'application/json',
          // 'Authorization':
          //     'Bearer ${Get.find<DeviceRepository>().getStringValue(LocalKeys.authToken).toString()}'
        });
  }

  ///ChangePassword api
  static Future<ResponseModel> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
    required bool isLoading,
  }) async {
    var data = {
      'current_password': currentPassword.toString(),
      'password': password.toString(),
      'password_confirmation': passwordConfirmation.toString(),
    };
    return await ApiRequest.makeRequest(
      request: MethodRequest.put,
      url: 'change-password',
      data: data,
      headers: {
        'Accept': 'application/json',
        // 'Authorization':
        //     'Bearer ${Get.find<DeviceRepository>().getStringValue(LocalKeys.authToken).toString()}'
      },
    );
  }

  ///Send Otp Api
  static Future<ResponseModel> sendOtp({
    required String email,
    required bool isLoading,
  }) async {
    var data = {
      'username': email.toString(),
    };
    return await ApiRequest.makeRequest(
        request: MethodRequest.post, url: 'forget-password', data: data);
  }

//  Reset Password Connect Helper
  static Future<ResponseModel> resetPassword({
    required String token,
    required String password,
    required String passwordConfirmation,
    required bool isLoading,
  }) async {
    var data = {
      // 'username': Get.find<DeviceRepository>().getStringValue('email'),
      'token': token.toString(),
      'password': password.toString(),
      'password_confirmation': passwordConfirmation.toString(),
    };
    return await ApiRequest.makeRequest(
      request: MethodRequest.post,
      url: 'reset-password',
      data: data,
    );
  }

  static Future<ResponseModel> getDropdown() async {
    return await ApiRequest.makeRequest(
      request: MethodRequest.get,
      url:
          'for-dropdown?licenses=true&services=true&visit_types=true&support_reasons=true',
      isLoading: false,
      // headers: {
      //   'Accept': 'application/json',
      //   'Authorization':
      //       'Bearer ${Get.find<DeviceRepository>().getStringValue(LocalKeys.authToken).toString()}'
      // },
    );
  }

  static Future<ResponseModel> getUserProfile({
    required bool isLoading,
    required String token,
  }) async {
    return await ApiRequest.makeRequest(
      request: MethodRequest.get,
      url: DataConstants.getUserProfile,
    );
  }

 static Future<ResponseModel> manageJobs({
    required String token,
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) async {
    return await ApiRequest.makeRequest(
        request: MethodRequest.get,
        url: 'jobs?status=$status&from_date=$fromDate&to_date=$toDate');
  }
}
