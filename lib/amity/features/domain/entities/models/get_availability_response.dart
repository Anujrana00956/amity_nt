import 'dart:convert';

GetAvailabilityResponse getAvailabilityResponseFromJson(String str) =>
    GetAvailabilityResponse.fromJson(json.decode(str));

class GetAvailabilityResponse {
  GetAvailabilityResponse({
    required this.status,
    required this.message,
    required this.availableList,
  });
  final bool status;
  final String message;
  final List<AvailableList> availableList;

  factory GetAvailabilityResponse.fromJson(Map<String, dynamic> json) =>
      GetAvailabilityResponse(
        status: json['status'],
        message: json['message'],
        availableList: List<AvailableList>.from(
            json['data'].map((x) => AvailableList.fromJson(x))),
      );
}

class AvailableList {
  AvailableList({
    required this.id,
    required this.date,
    required this.isAvailable,
  });
  final int id;
  final String date;
  final bool isAvailable;

  factory AvailableList.fromJson(Map<String, dynamic> json) => AvailableList(
        id: json['id'],
        date: json['date'],
        isAvailable: json['is_available'],
      );
}
