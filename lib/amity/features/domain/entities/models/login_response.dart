import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userRole,
    required this.signature,
  });
  final bool status;
  final String message;
  final String token;
  final int userId;
  final String userName;
  final String userEmail;
  final String userRole;
  final String signature;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      status: json['status'],
      message: json['message'],
      token: json['data']['token'],
      userId: json['data']['user']['id'],
      userName: json['data']['user']['name'],
      userEmail: json['data']['user']['email'],
      userRole: json['data']['user']['role'],
      signature: json['data']['user']['nurse']['signature'] == null
          ? ''
          : json['data']['user']['nurse']['signature']['signature_url']
                  as String? ??
              '');
}
