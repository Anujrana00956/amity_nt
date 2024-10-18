import 'dart:convert';

RecordResponse recordResponseFromJson(String str) =>
    RecordResponse.fromJson(json.decode(str));

class RecordResponse {
  RecordResponse({
    required this.status,
    required this.message,
    required this.visits,
    required this.documentation,
    required this.startMiles,
    required this.endMiles,
    required this.totalMiles,
  });
  final bool status;
  final String message;
  List<DetailList> visits;
  List<DetailList> documentation;
  final String startMiles;
  final String endMiles;
  final String totalMiles;

  factory RecordResponse.fromJson(Map<String, dynamic> json) {
    return RecordResponse(
      status: json['status'],
      message: json['message'],
      visits: (json['data']['visits'] != null)
          ? List<DetailList>.from(
              json['data']['visits'].map((x) => DetailList.fromJson(x)))
          : [],
      documentation: (json['data']['documentation'] != null)
          ? List<DetailList>.from(
              json['data']['documentation'].map((x) => DetailList.fromJson(x)))
          : [],
      startMiles: json['data']['miles']['start_miles'] ?? '',
      endMiles: json['data']['miles']['end_miles'] ?? '',
      totalMiles: json['data']['miles']['total_miles'] ?? '',
    );
  }
}

class DetailList {
  DetailList({
    required this.id,
    required this.patientName,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.summary,
    required this.startMilage,
    required this.endMilage,
    required this.totalMilage,
    required this.serviceName,
    required this.serviceId,
    required this.media,
  });
  final int id;
  final String patientName;
  final String startTime;
  final String endTime;
  final String location;
  final String summary;
  final String startMilage;
  final String endMilage;
  final String totalMilage;
  final String serviceName;
  final int serviceId;
  final String media;

  factory DetailList.fromJson(Map<String, dynamic> json) => DetailList(
        id: json['id'],
        patientName:
            json.containsKey('patient_name') ? json['patient_name'] ?? '' : '',
        startTime: json['start_time'] as String? ?? '',
        endTime: json['end_time'] as String? ?? '',
        location: json.containsKey('location')
            ? json['location'] as String? ?? ''
            : '',
        summary: json['summary'] as String? ?? '',
        startMilage: json.containsKey('start_mileage')
            ? json['start_mileage'] ?? ''
            : '',
        endMilage:
            json.containsKey('end_mileage') ? json['end_mileage'] ?? '' : '',
        totalMilage:
            json.containsKey('total_miles') ? json['total_miles'] ?? '' : '',
        serviceName: json.containsKey('type') ? json['type']['name'] ?? '' : '',
        serviceId: json.containsKey('type') ? json['type']['id'] ?? 0 : 0,
        media: json.containsKey('media') ? json['media'] ?? '' : '',
      );
}
