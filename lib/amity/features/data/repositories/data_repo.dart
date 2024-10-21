import 'package:amity_nt/amity/features/data/data_sources/remote/connect_helper.dart';
import 'package:amity_nt/amity/features/domain/entities/models/response_model.dart';

class DataRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.


  void clearBox() {
    throw UnimplementedError();
  }

  String getStringValue(String key) {
    throw UnimplementedError();
  }

  void saveValue(key, value) {
    throw UnimplementedError();
  }

  // Login Data Repository

  Future<ResponseModel> authLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    print('the connectHelper with error $email =>>$password');
    return await ConnectHelper.authLogin(
      email: email,
      password: password,
      deviceToken: deviceToken,
    );
  }

// Logout Data Repository
  Future<ResponseModel> logout() async {
    return await ConnectHelper.logout();
  }

  //  Change Password Data Repository
  Future<ResponseModel> changePassword(
          {required String currentPassword,
          required String password,
          required String passwordConfirmation,
          required bool isLoading}) async =>
      await ConnectHelper.changePassword(
        currentPassword: currentPassword,
        password: password,
        passwordConfirmation: passwordConfirmation,
        isLoading: isLoading,
      );

  // Forgot Password Data Repository
  static Future<ResponseModel> sendOtp(
      {required String email, required bool isLoading}) async {
    return await ConnectHelper.sendOtp(
      email: email,
      isLoading: isLoading,
    );
  }

  // Reset Password Data Repository
  Future<ResponseModel> resetPassword(
          {required String token,
          required String password,
          required String passwordConfirmation,
          required bool isLoading}) async =>
      await ConnectHelper.resetPassword(
        token: token,
        password: password,
        passwordConfirmation: passwordConfirmation,
        isLoading: isLoading,
      );

  // // Get Dropdown Data Repository
 static Future<ResponseModel> getDropdown() async {
    return await ConnectHelper.getDropdown();
  }

  // // Edit Profile Data Repository
  // Future<ResponseModel> editProfile({
  //   required String name,
  //   required String radius,
  //   required String phone,
  //   required String email,
  //   required String location,
  //   required bool isLoading,
  //   required String licenseId,
  //   required String serviceId,
  //   required String latitude,
  //   required String longitude,
  // }) async =>
  //     await connectHelper.editProfile(
  //       name: name,
  //       radius: radius,
  //       phone: phone,
  //       email: email,
  //       location: location,
  //       isLoading: isLoading,
  //       licenseId: licenseId,
  //       serviceId: serviceId,
  //       latitude: latitude,
  //       longitude: longitude,
  //     );

 static Future<ResponseModel> getUserProfile({
    required bool isLoading,
    required String token,
  }) async {
    return await ConnectHelper.getUserProfile(
      isLoading: isLoading,
      token: token,
    );
  }

  // Future<ResponseModel> sendAvailability({
  //   required String token,
  //   required bool isLoading,
  //   required String year,
  //   required String month,
  //   required List<String> availableDays,
  // }) async {
  //   return await connectHelper.sendAvailability(
  //     token: token,
  //     isLoading: isLoading,
  //     year: year,
  //     month: month,
  //     availableDays: availableDays,
  //   );
  // }

  // Future<ResponseModel> getAvailability(
  //     {required String token,
  //     required bool isLoading,
  //     required String year,
  //     required String month}) async {
  //   return await connectHelper.getAvailability(
  //     token: token,
  //     isLoading: isLoading,
  //     year: year,
  //     month: month,
  //   );
  // }

  // Future<ResponseModel> getNotifications({
  //   required String token,
  //   required bool isLoading,
  // }) async {
  //   return await connectHelper.getNotifications(
  //     token: token,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<ResponseModel> acceptJob({
  //   required String token,
  //   required bool isLoading,
  //   bool ignoreBooked = false,
  //   required String jobId,
  // }) async {
  //   return await connectHelper.acceptJob(
  //     token: token,
  //     isLoading: isLoading,
  //     ignoreBooked: ignoreBooked,
  //     jobId: jobId,
  //   );
  // }

  // Future<ResponseModel> rejectJob({
  //   required String token,
  //   required bool isLoading,
  //   required String jobId,
  // }) async {
  //   return await connectHelper.rejectJob(
  //     token: token,
  //     isLoading: isLoading,
  //     jobId: jobId,
  //   );
  // }

  Future<ResponseModel> manageJobs({
    required String token,
    required String fromDate,
    required String toDate,
    required bool isLoading,
    required String status,
  }) async {
    return await ConnectHelper.manageJobs(
      token: token,
      fromDate: fromDate,
      toDate: toDate,
      isLoading: isLoading,
      status: status,
    );
  }

  // Future<ResponseModel> getJobCalendar(
  //     {required String token,
  //     required bool isLoading,
  //     required String year,
  //     required String month}) async {
  //   return await connectHelper.getJobCalendar(
  //     token: token,
  //     isLoading: isLoading,
  //     year: year,
  //     month: month,
  //   );
  // }

  // Future<ResponseModel> jobHistory(
  //     {required String token,
  //     required bool isLoading,
  //     required String fromDate,
  //     required String toDate,
  //     required String jobId}) async {
  //   return await connectHelper.jobHistory(
  //     token: token,
  //     isLoading: isLoading,
  //     fromDate: fromDate,
  //     toDate: toDate,
  //     jobId: jobId,
  //   );
  // }

  // Future<ResponseModel> manageJobAction(
  //     {required String token,
  //     required bool isLoading,
  //     required String action,
  //     required String timeInUTC,
  //     required String jobId}) async {
  //   return await connectHelper.manageJobAction(
  //     token: token,
  //     isLoading: isLoading,
  //     action: action,
  //     timeInUTC: timeInUTC,
  //     jobId: jobId,
  //   );
  // }

  // Future<ResponseModel> sendPatientDetails(
  //     {required String token,
  //     required bool isLoading,
  //     required String signImage,
  //     required String pageFrom,
  //     required String attendanceId,
  //     required String patientName,
  //     required String startTime,
  //     required String endTime,
  //     required String location,
  //     required String longitude,
  //     required String latitude,
  //     required String summary,
  //     required String serviceId}) async {
  //   return await connectHelper.sendPatientDetails(
  //     token: token,
  //     isLoading: isLoading,
  //     signImage: signImage,
  //     pageFrom: pageFrom,
  //     attendanceId: attendanceId,
  //     patientName: patientName,
  //     startTime: startTime,
  //     endTime: endTime,
  //     location: location,
  //     longitude: longitude,
  //     latitude: latitude,
  //     summary: summary,
  //     serviceId: serviceId,
  //   );
  // }

  // Future<ResponseModel> getRecordsData(
  //     {required String token,
  //     required bool isLoading,
  //     required String attendanceId}) async {
  //   return await connectHelper.getRecordsData(
  //     token: token,
  //     isLoading: isLoading,
  //     attendanceId: attendanceId,
  //   );
  // }

  // Future<ResponseModel> getPosts({
  //   required String token,
  //   required bool isLoading,
  // }) async {
  //   return await connectHelper.getPosts(
  //     token: token,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<ResponseModel> getDocumentation({
  //   required String token,
  //   required bool isLoading,
  //   required String attendanceId,
  // }) async {
  //   return await connectHelper.getDocumentation(
  //     token: token,
  //     isLoading: isLoading,
  //     attendanceId: attendanceId,
  //   );
  // }

  // Future<ResponseModel> updateVisit(
  //     {required String visitId,
  //     required String token,
  //     required bool isLoading,
  //     required String signImage,
  //     required String pageFrom,
  //     required String attendanceId,
  //     required String patientName,
  //     required String startTime,
  //     required String endTime,
  //     required String summary,
  //     required String serviceId}) async {
  //   return await connectHelper.updateVisit(
  //     visitId: visitId,
  //     token: token,
  //     isLoading: isLoading,
  //     signImage: signImage,
  //     pageFrom: pageFrom,
  //     attendanceId: attendanceId,
  //     patientName: patientName,
  //     startTime: startTime,
  //     endTime: endTime,
  //     summary: summary,
  //     serviceId: serviceId,
  //   );
  // }

  // //Support

  // Future<ResponseModel> support({
  //   required String image,
  //   required String name,
  //   required String email,
  //   required String reasonId,
  //   required String message,
  //   required String token,
  //   required bool isLoading,
  // }) async =>
  //     await connectHelper.support(
  //       name: name,
  //       email: email,
  //       reasonId: reasonId,
  //       message: message,
  //       token: token,
  //       isLoading: isLoading,
  //       image: image,
  //     );

  // Future<ResponseModel> getWebLoginToken({
  //   required String token,
  //   required bool isLoading,
  // }) async {
  //   return await connectHelper.getWebLoginToken(
  //     token: token,
  //     isLoading: isLoading,
  //   );
  // }

  // Future<ResponseModel> saveAndUpdateMiles({
  //   required String token,
  //   required bool isLoading,
  //   required String miles,
  //   required String attendanceId,
  // }) async {
  //   return await connectHelper.saveAndUpdateMiles(
  //     token: token,
  //     isLoading: isLoading,
  //     miles: miles,
  //     attendanceId: attendanceId,
  //   );
  // }

  // Future<ResponseModel> saveAndUpdateEndMiles({
  //   required String token,
  //   required bool isLoading,
  //   required String endMiles,
  //   required String attendanceId,
  // }) async {
  //   return await connectHelper.saveAndUpdateEndMiles(
  //     token: token,
  //     isLoading: isLoading,
  //     endMiles: endMiles,
  //     attendanceId: attendanceId,
  //   );
  // }

  // Future<ResponseModel> readNotification({
  //   required String token,
  //   required bool isLoading,
  //   required String jobId,
  // }) async {
  //   return await connectHelper.readNotification(
  //     token: token,
  //     isLoading: isLoading,
  //     jobId: jobId,
  //   );
  // }

  // Future<ResponseModel> appUpdateApi({
  //   required String token,
  //   required bool isLoading,
  // }) async {
  //   return await connectHelper.appUpdateApi(
  //     token: token,
  //     isLoading: isLoading,
  //   );
  // }
}
