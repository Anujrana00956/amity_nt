import 'dart:convert';

JobActionResponse jobActionResponseFromJson(String str) =>
    JobActionResponse.fromJson(json.decode(str));

class JobActionResponse {
  JobActionResponse({
    required this.status,
    required this.message,
    required this.code,
  });
  final bool status;
  final String message;
  final String code;

  factory JobActionResponse.fromJson(Map<String, dynamic> json) =>
      JobActionResponse(
        status: json['status'],
        message: json['message'],
        code: json['data'].runtimeType == List
            ? ''
            : json['data'].containsKey('code')
                ? json['data']['code']
                : '',
      );
}
