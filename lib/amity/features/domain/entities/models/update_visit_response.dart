import 'dart:convert';

UpdateVisitResponse updateVisitResponseFromJson(String str) =>
    UpdateVisitResponse.fromJson(json.decode(str));

class UpdateVisitResponse {
  UpdateVisitResponse({required this.message, required this.status});
  final bool status;
  final String message;

  factory UpdateVisitResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVisitResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}
