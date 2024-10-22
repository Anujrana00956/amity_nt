import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/constant/local_key_constant.dart';
import 'package:amity_nt/amity/features/data/data_constant.dart';
import 'package:amity_nt/amity/features/data/data_sources/local/hive_manager.dart';
import 'package:amity_nt/amity/features/data/data_sources/remote/api_request.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:flutter/material.dart';

class ConnectHelper {
  final _hivemnager = HiveManager();
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
      true,
      data: data,
      request: MethodRequest.post,
      headers: {'Accept': 'application/json'},
    );
  }

// LogOut Api
  Future<ResponseModel> logout() async {
    return await ApiRequest.makeRequest(
        request: MethodRequest.post,
        url: 'logout',
        true,
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${_hivemnager.getStringValue(LocalKeys.authToken).toString()}'
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
      isLoading,
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
        request: MethodRequest.post,
        url: 'forget-password',
        data: data,
        isLoading);
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
      isLoading,
      request: MethodRequest.post,
      url: 'reset-password',
      data: data,
    );
  }

  Future<ResponseModel> getDropdown() async {
    return await ApiRequest.makeRequest(
      request: MethodRequest.get,
      url:
          'for-dropdown?licenses=true&services=true&visit_types=true&support_reasons=true',
      false,
      headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${_hivemnager.getStringValue(LocalKeys.authToken).toString()}'
      },
    );
  }

  static Future<ResponseModel> getUserProfile({
    required bool isLoading,
    required String token,
  }) async {
    return await ApiRequest.makeRequest(
      isLoading,
      request: MethodRequest.get,
      url: DataConstants.getUserProfile,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
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
      isLoading,
      request: MethodRequest.get,
      url: 'jobs?status=$status&from_date=$fromDate&to_date=$toDate',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
  }

  static Future<ResponseModel> getWebLoginToken({
    required String token,
    required bool isLoading,
  }) async {
    return await ApiRequest.makeRequest(
      isLoading,
      request: MethodRequest.get,
      url: 'web-login-token',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
  }
}
