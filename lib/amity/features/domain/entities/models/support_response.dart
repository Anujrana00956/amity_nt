import 'dart:convert';

SupportResponsee supportResponseeFromJson(String str) =>
    SupportResponsee.fromJson(json.decode(str));

class SupportResponsee {
  final bool status;
  final String message;
 
  SupportResponsee({
    required this.status,
    required this.message,
    
  });
  factory SupportResponsee.fromJson(Map<String, dynamic> json) =>
      SupportResponsee(
        status: json["status"],
        message: json["message"],
       
      );
}
