import 'dart:convert';

AppUpdate appupdatefromJson(String str) => AppUpdate.fromJson(json.decode(str));

class AppUpdate {
  AppUpdate({
    required this.status,
    required this.message,
    required this.androidVersion,
    required this.iosVersion,
  });
  final bool status;
  final String message;
  final String androidVersion;
  final List<String> iosVersion;
  factory AppUpdate.fromJson(Map<String, dynamic> json) => AppUpdate(
        status: json['status'] ?? false,
        message: json['message'] ?? "",
        androidVersion: json['data']['andriodVersion'] ?? "",
        iosVersion: json['data'] == null
            ? []
            : json['data']['iosVersion'] == null
                ? []
                : List<String>.from(
                    json['data']['iosVersion'].map((x) => x.toString())),
      );
}
