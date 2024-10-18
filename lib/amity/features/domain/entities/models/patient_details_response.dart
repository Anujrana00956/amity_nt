import 'dart:convert';

PatientDetailsResponse patientDetailsResponseFromJson(String str) =>
    PatientDetailsResponse.fromJson(json.decode(str));

class PatientDetailsResponse {
  PatientDetailsResponse({
    required this.status,
    required this.message,
    required this.id,
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.summary,
    required this.visitTypeId,
    required this.visitTypeName,
  });
  final bool status;
  final String message;
  final int id;
  final String patientName;
  final String startTime;
  final String endTime;
  final String summary;
  final int visitTypeId;
  final String visitTypeName;

  factory PatientDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PatientDetailsResponse(
      status: json['status'],
      message: json['message'],
      id: json['data']['id'] as int? ?? 0,
      patientName: json['data']['patient_name'] ?? '',
      startTime: json['data']['start_time'] ?? '',
      endTime: json['data']['end_time'] ?? '',
      summary: json['data']['summary'] ?? '',
      visitTypeId: json['data'].containsKey('type')
          ? json['data']['type']['id'] ?? 0
          : 0,
      visitTypeName: json['data'].containsKey('type')
          ? json['data']['type']['name'] ?? ''
          : '',
    );
  }
}
