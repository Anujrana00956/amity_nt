import 'dart:convert';

GetWebLoginTokenResponse getWebLoginTokenResponseFromJson(String str) =>
    GetWebLoginTokenResponse.fromJson(json.decode(str));

class GetWebLoginTokenResponse {
  GetWebLoginTokenResponse({
    required this.status,
    required this.message,
    required this.webLoginToken,
  });
  final bool status;
  final String message;
  final String webLoginToken;

  factory GetWebLoginTokenResponse.fromJson(Map<String, dynamic> json) =>
      GetWebLoginTokenResponse(
        status: json['status'] as bool? ?? false,
        message: json['message'] as String? ?? '',
        webLoginToken: json['data']['web_login_token'] as String? ?? '',
      );
}
