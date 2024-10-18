import 'dart:convert';

JobHistoryResponse jobHistoryResponseFromJson(String str) =>
    JobHistoryResponse.fromJson(json.decode(str));

class JobHistoryResponse {
  JobHistoryResponse({
    required this.status,
    required this.message,
    required this.historyList,
  });
  final bool status;
  final String message;
  final List<HistoryList> historyList;

  factory JobHistoryResponse.fromJson(Map<String, dynamic> json) =>
      JobHistoryResponse(
        status: json['status'],
        message: json['message'],
        historyList: List<HistoryList>.from(
            json['data'].map((x) => HistoryList.fromJson(x))),
      );
}

class HistoryList {
  HistoryList({
    required this.id,
    required this.clockInTime,
    required this.clockOutTime,
    required this.pausedDuration,
    required this.lastPausedTime,
    required this.totalHours,
    required this.clientName,
    required this.serviceName,
    required this.date,
    required this.hasDocumentation,
    required this.hasStartMiles,
    required this.hasEndMiles,
  });
  final int id;
  final String clockInTime;
  final String clockOutTime;
  final String pausedDuration;
  final String lastPausedTime;
  final String totalHours;
  final String clientName;
  final String serviceName;
  final String date;
  final bool hasDocumentation;
  final bool hasStartMiles;
  final bool hasEndMiles;

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
        id: json['id'] as int? ?? 0,
        clockInTime: json['clock_in_time'] as String? ?? '',
        clockOutTime: json['clock_out_time'] as String? ?? '',
        pausedDuration: json['paused_duration_seconds'] as String? ?? '',
        lastPausedTime: json['last_paused_datetime'] as String? ?? '',
        totalHours: json['total_hours'] as String? ?? '',
        clientName: json['client']['name'] as String? ?? '',
        serviceName: json['service']['name'] as String? ?? '',
        date: json['date'] as String? ?? '',
        hasDocumentation: json['has_documentation'] as bool? ?? false,
        hasStartMiles: json['has_start_miles'] as bool? ?? false,
        hasEndMiles: json['has_end_miles'] as bool? ?? false,
      );
}
