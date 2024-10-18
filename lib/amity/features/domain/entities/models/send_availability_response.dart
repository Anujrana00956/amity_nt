import 'dart:convert';

SendAvailabilityResponse sendAvailabilityResponseFromJson(String str) =>
    SendAvailabilityResponse.fromJson(json.decode(str));

class SendAvailabilityResponse {
  SendAvailabilityResponse({
    required this.status,
    required this.message,
  });
  final bool status;
  final String message;

  factory SendAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      SendAvailabilityResponse(
        status: json['status'],
        message: json['message'],
      );
}
