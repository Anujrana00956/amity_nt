import 'dart:convert';

GetUserProfileResponse getUserProfileResponseFromJson(String str) =>
    GetUserProfileResponse.fromJson(json.decode(str));

class GetUserProfileResponse {
  GetUserProfileResponse({
    required this.status,
    required this.message,
    required this.userId,
    required this.userName,
    required this.userRadius,
    required this.userPhone,
    required this.userEmail,
    required this.userLocation,
    required this.liscenseId,
    required this.liscenseName,
    required this.serviceId,
    required this.serviceName,
    required this.signature,
    required this.longitude,
    required this.latitude,
    required this.isDocumentUploaded,
  });
  final bool status;
  final String message;
  final int userId;
  final String userName;
  final String userRadius;
  final String userPhone;
  final String userEmail;
  final String userLocation;
  final int liscenseId;
  final String liscenseName;
  final int serviceId;
  final String serviceName;
  final String signature;
  final String longitude;
  final String latitude;
  final bool isDocumentUploaded;

  factory GetUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetUserProfileResponse(
        status: json['status'],
        message: json['message'] as String? ?? '',
        userId: json['data']['id'],
        userName: json['data']['name'] as String? ?? '',
        userRadius: json['data']['radius'] as String? ?? '',
        userPhone: json['data']['phone'] as String? ?? '',
        userEmail: json['data']['email'] as String? ?? '',
        userLocation: json['data']['location'] as String? ?? '',
        liscenseId: json['data']['license']['id'],
        liscenseName: json['data']['license']['name'] as String? ?? '',
        serviceId: json['data']['service']['id'],
        serviceName: json['data']['service']['name'] as String? ?? '',
        signature: json['data']['signature'] == null
            ? ''
            : json['data']['signature']['signature_url'] as String? ?? '',
        longitude: json['data']['longitude'] as String? ?? '',
        latitude: json['data']['latitude'] as String? ?? '',
        isDocumentUploaded:
            json['data']['paperwork_required'] as bool? ?? false,
      );
}
