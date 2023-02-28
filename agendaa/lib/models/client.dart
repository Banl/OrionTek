// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

import 'address.dart';

List<Clients> clientFromJson(String str) =>
    List<Clients>.from(json.decode(str).map((x) => Clients.fromJson(x)));

String clientToJson(List<Clients> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clients {
  Clients({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNum,
  });

  String name;
  int id;
  List<Address> address;
  String email;
  String phoneNum;

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
        name: json["name"],
        id: json["id"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        email: json["email"],
        phoneNum: json["phoneNum"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "email": email,
        "phoneNum": phoneNum,
      };
}
