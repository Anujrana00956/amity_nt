import 'dart:convert';
import 'package:intl/intl.dart';

JobListResponse jobListResponseFromJson(String str) =>
    JobListResponse.fromJson(json.decode(str));

class JobListResponse {
  JobListResponse({
    required this.status,
    required this.message,
    required this.notificationList,
  });
  final bool status;
  final String message;
  final List<NotificationList> notificationList;

  factory JobListResponse.fromJson(Map<String, dynamic> json) =>
      JobListResponse(
        status: json['status'],
        message: json['message'],
        notificationList: List<NotificationList>.from(
            json['data'].map((x) => NotificationList.fromJson(x))),
      );
}

class NotificationList {
  NotificationList({
    required this.id,
    required this.jobName,
    required this.clientName,
    required this.createdAt,
    required this.status,
    required this.serviceType,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.numberOfDays,
    required this.requiredNurse,
    required this.workingDays,
    required this.shiftTime,
    required this.isFixedDays,
    required this.jobDates,
    required this.read,
  });
  final int id;
  final String jobName;
  final String clientName;
  final String createdAt;
  final String status;
  final String serviceType;
  final String startDate;
  final String endDate;
  final String location;
  final String numberOfDays;
  final bool isFixedDays;
  final String requiredNurse;

  final List<WorkingDays> workingDays;
  final String shiftTime;
  final List jobDates;
  final int read;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        id: json['id'],
        jobName: json['job']['name'] as String? ?? '-/-',
        clientName: json['client']['name'] as String? ?? '',
        createdAt: json['created_at'] as String? ?? '',
        status: json['status'],
        serviceType: json['service']['name'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        location: json['location'],
        numberOfDays: json['number_of_week_days'],
        requiredNurse: json['no_of_nurses'],
        workingDays: json.containsKey('job_days')
            ? List<WorkingDays>.from(
                json['job_days'].map((x) => WorkingDays.fromJson(x)))
            : [],
        isFixedDays: json['is_fixed_days'],
        shiftTime:
            json.containsKey('job_shift') ? json['job_shift']['name'] : 'NA',
        jobDates: json.containsKey('dates') ? json['dates'] : [],
        read: json['read'] ?? "0",
      );
}

class WorkingDays {
  WorkingDays({
    required this.id,
    required this.days,
    required this.dayName,
  });
  final int id;
  final int days;
  final String dayName;

  factory WorkingDays.fromJson(Map<String, dynamic> json) => WorkingDays(
        id: json['id'],
        days: json['days'],
        dayName: json['days_name'],
      );
}
