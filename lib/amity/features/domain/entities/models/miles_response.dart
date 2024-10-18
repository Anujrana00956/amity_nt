import 'dart:convert';

MilesResponse milesResponseFromJson(String str) =>
    MilesResponse.fromJson(json.decode(str));

class MilesResponse {
  MilesResponse({
    required this.message,
    required this.status,
  });
  final bool status;
  final String message;

  factory MilesResponse.fromJson(Map<String, dynamic> json) => MilesResponse(
        message: json['message'],
        status: json['status'],
      );
}
