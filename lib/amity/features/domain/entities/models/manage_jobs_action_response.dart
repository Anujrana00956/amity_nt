import 'dart:convert';

ManageJobsActionResponse manageJobsActionResponseFromJson(String str) =>
    ManageJobsActionResponse.fromJson(json.decode(str));

class ManageJobsActionResponse {
  ManageJobsActionResponse({
    required this.status,
    required this.message,
    required this.id,
    required this.clockInTime,
    required this.clockOutTime,
    required this.pausedDuration,
    required this.lastPausedTime,
    required this.date,
    required this.clientName,
    required this.serviceType,
  });
  final bool status;
  final String message;
  final int id;
  final String clockInTime;
  final String clockOutTime;
  final String pausedDuration;
  final String lastPausedTime;
  final String date;
  final String clientName;
  final String serviceType;

  factory ManageJobsActionResponse.fromJson(Map<String, dynamic> json) =>
      ManageJobsActionResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        id: json['data']['id'] as int? ?? 0,
        clockInTime: json['data']['clock_in_time'] as String? ?? '',
        clockOutTime: json['data']['clock_out_time'] as String? ?? '',
        pausedDuration: (json['data']['paused_duration_seconds'] is int)
            ? json['data']['paused_duration_seconds'].toString()
            : json['data']['paused_duration_seconds'] as String? ?? '',
        lastPausedTime: json['data']['last_paused_datetime'] as String? ?? '',
        date: json['data']['date'] as String? ?? '',
        clientName: json['data']['client']['name'] as String? ?? '',
        serviceType: json['data']['service']['name'] as String? ?? '',
      );
}
