import 'dart:convert';

EditProfileResponsee editProfileResponseeFromJson(String str) =>
    EditProfileResponsee.fromJson(json.decode(str));

class EditProfileResponsee {
  final bool status;
  final String message;
  final String name;
  final String radius;
  final String phone;
  final String location;
  final int licenseId;
  final String licenseName;
  final int serviceId;
  final String serviceName;
  EditProfileResponsee(
      {required this.status,
      required this.message,
      required this.name,
      required this.radius,
      required this.phone,
      required this.location,
      required this.licenseId,
      required this.licenseName,
      required this.serviceId,
      required this.serviceName});
  factory EditProfileResponsee.fromJson(Map<String, dynamic> json) =>
      EditProfileResponsee(
          status: json["status"],
          message: json["message"],
          name: json['data']["name"],
          radius: json['data']["radius"],
          phone: json['data']["phone"],
          location: json['data']["location"],
          licenseId: json["data"]["license"]["id"],
          licenseName: json["data"]["license"]["name"],
          serviceId: json["data"]["service"]["id"],
          serviceName: json["data"]["service"]["name"]);
}
