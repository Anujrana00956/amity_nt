import 'dart:convert';

DropDownResponse dropDownResponseFromJson(String str) =>
    DropDownResponse.fromJson(json.decode(str));

class DropDownResponse {
  DropDownResponse({
    this.status,
    this.licenses,
    this.services,
    this.visitTypes,
    this.reason,
  });
  final bool? status;
  final List<Items>? licenses;
  final List<Items>? services;
  final List<Items>? visitTypes;
  final List<Items>? reason;

  factory DropDownResponse.fromJson(Map<String, dynamic> json) {
    return DropDownResponse(
      status: json['status'],
      licenses: List<Items>.from(
          json['data']['licenses'].map((x) => Items.fromJson(x))),
      services: List<Items>.from(
          json['data']['services'].map((x) => Items.fromJson(x))),
      visitTypes: List<Items>.from(
          json['data']['visit_types'].map((x) => Items.fromJson(x))),
      reason: List<Items>.from(
          json['data']['support_reasons'].map((x) => Items.fromJson(x))),
    );
  }
}

class Items {
  int? id;
  String? name;
  Items({
    this.id,
    this.name,
  });
  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        name: json["name"],
      );
}
