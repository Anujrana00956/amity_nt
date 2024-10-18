import 'package:amity_nt/amity/app/core/app_enums/app_enums.dart';
import 'package:amity_nt/amity/app/core/constant/local_key_constant.dart';
import 'package:amity_nt/amity/features/data/data_sources/remote/api_request.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class ConnectHelper {
  // Login Api
  Future<ResponseModel> authLogin({
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
}

// LogOut Api
Future<ResponseModel> logout() async {
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
Future<ResponseModel> changePassword({
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
Future<ResponseModel> sendOtp({
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
Future<ResponseModel> resetPassword({
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
