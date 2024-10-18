import 'dart:convert';

ReadNotificationResponse readNotificationResponseFromJson(String str) =>
    ReadNotificationResponse.fromJson(json.decode(str));

class ReadNotificationResponse {
  ReadNotificationResponse({
    required this.status,
    required this.message,
  });
  final bool status;
  final String message;

  factory ReadNotificationResponse.fromJson(Map<String, dynamic> json) =>
      ReadNotificationResponse(
        status: json['status'],
        message: json['message'],
      );
}
