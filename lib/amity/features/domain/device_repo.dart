import 'package:amity_nt/amity/features/domain/entities/models/edit_profile_response.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';
import 'package:hive/hive.dart';

class DeviceRepository {
  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>('Amity');

  ///to save a value
  
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  ///to get that saved value.
  
  String getStringValue(String key) {
    var box = _getBox();
    var value = box.get(key) as String? ?? '';
    return value;
  }

  ///to get that saved value.
  String getDynamicValue(dynamic key) {
    var box = _getBox();
    var value = box.get(key);
    return value;
  }

  /// clear all data
  
  void clearBox() async {
    await _getBox().clear();
  }

  // Login Device Repository
 
  Future authLogin(
      {required String email,
      required String password,
      required String deviceToken}) async {
    return throw UnimplementedError();
  }

  // Logout Device Repository
  Future<ResponseModel> logout() async => throw UnimplementedError();

  // Change Password Device Repository
  Future<ResponseModel> changePassword({
    required String current_password,
    required String password,
    required String password_confirmation,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }

  // Forgot Password Device Repository
  static Future<ResponseModel> sendOtp(
      {required String email, required bool isLoading}) {
    throw UnimplementedError();
  }

  // Reset Password Device Repository
  Future<ResponseModel> resetPassword({
    required String token,
    required String password,
    required String password_confirmation,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }


  // Get Dropdown Data Repository
  static Future getDropdown() {
    throw UnimplementedError();
  }

  // Edit Profile Auth Cases
  Future<EditProfileResponsee> editProfile(
      {required String name,
      required String radius,
      required String phone,
      required String email,
      required String location,
      required bool isLoading,
      required String licenseId,
      required String serviceId}) {
    throw UnimplementedError();
  }


  Future getUserProfile({
    required bool isLoading,
    required String token,
  }) {
    throw UnimplementedError();
  }


  Future sendAvailability(
      {required String token,
      required bool isLoading,
      required String year,
      required String month,
      required List<String> availableDays}) {
    throw UnimplementedError();
  }


  Future getAvailability(
      {required String token,
      required bool isLoading,
      required String year,
      required String month}) {
    throw UnimplementedError();
  }


  Future getNotifications({
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }


  Future acceptJob({
    required String token,
    required bool isLoading,
    bool ignoreBooked = false,
    required String jobId,
  }) {
    throw UnimplementedError();
  }


  Future rejectJob({
    required String token,
    required bool isLoading,
    required String jobId,
  }) {
    throw UnimplementedError();
  }


  Future manageJobs({
    required String token,
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) {
    throw UnimplementedError();
  }

  /// --------------------------------------------


  Future getJobCalendar(
      {required String token,
      required bool isLoading,
      required String year,
      required String month}) {
    throw UnimplementedError();
  }


  Future jobHistory(
      {required String token,
      required bool isLoading,
      required String fromDate,
      required String toDate,
      required String jobId}) {
    throw UnimplementedError();
  }


  Future manageJobAction(
      {required String token,
      required bool isLoading,
      required String action,
      required String timeInUTC,
      required String jobId}) {
    throw UnimplementedError();
  }


  Future sendPatientDetails(
      {required String token,
      required bool isLoading,
      required String signImage,
      required String pageFrom,
      required String attendanceId,
      required String patientName,
      required String startTime,
      required String endTime,
      required String location,
      required String longitude,
      required String latitude,
      required String summary,
      required String serviceId}) {
    throw UnimplementedError();
  }


  Future getRecordsData({
    required String token,
    required bool isLoading,
    required String attendanceId,
  }) {
    throw UnimplementedError();
  }


  Future getPosts({
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }


  Future getDocumentation({
    required String token,
    required bool isLoading,
    required String attendanceId,
  }) {
    throw UnimplementedError();
  }


  Future updateVisit(
      {required String visitId,
      required String token,
      required bool isLoading,
      required String signImage,
      required String pageFrom,
      required String attendanceId,
      required String patientName,
      required String startTime,
      required String endTime,
      required String summary,
      required String serviceId}) {
    throw UnimplementedError();
  }

  //Support

  Future support({
    required String? image,
    required String name,
    required String email,
    required String reasonId,
    required String message,
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }


  Future getWebLoginToken({
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }


  Future saveAndUpdateMiles({
    required String token,
    required bool isLoading,
    required String miles,
    required String attendanceId,
  }) {
    throw UnimplementedError();
  }


  Future saveAndUpdateEndMiles({
    required String token,
    required bool isLoading,
    required String endMiles,
    required String attendanceId,
  }) {
    throw UnimplementedError();
  }


  Future readNotification({
    required String token,
    required bool isLoading,
    required String jobId,
  }) {
    throw UnimplementedError();
  }

  Future appUpdateApi({
    required String token,
    required bool isLoading,
  }) {
    throw UnimplementedError();
  }
}
