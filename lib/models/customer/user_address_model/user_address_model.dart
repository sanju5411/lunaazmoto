// To parse this JSON data, do
//
//     final authAddress = authAddressFromJson(jsonString);

import 'dart:convert';

AuthAddress authAddressFromJson(String str) => AuthAddress.fromJson(json.decode(str));

String authAddressToJson(AuthAddress data) => json.encode(data.toJson());

class AuthAddress {
  AuthAddress({
  this.status,
   this.message,
   this.addresses,
  });

  String? status;
  String? message;
  List<Address>? addresses;

  factory AuthAddress.fromJson(Map<String, dynamic> json) => AuthAddress(
    status: json["status"],
    message: json["message"],
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.id,
    required this.title,
    required this.name,
    required this.mobile,
    required this.alternateMobile,
    required this.addressLine1,
    required this.addressLine2,
    required this.locality,
    required this.landmark,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
    this.details,
    required this.status,
    this.latitude,
    this.longitude,
    this.fullAddress,
  });

  int id;
  String title;
  String name;
  String mobile;
  String alternateMobile;
  String addressLine1;
  String addressLine2;
  String locality;
  String landmark;
  String pincode;
  String city;
  String state;
  String country;
  dynamic details;
  String status;
  dynamic latitude;
  dynamic longitude;
  String? fullAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    title: json["title"],
    name: json["name"],
    mobile: json["mobile"],
    alternateMobile: json["alternate_mobile"],
    addressLine1: json["address_line1"],
    addressLine2: json["address_line2"],
    locality: json["locality"],
    landmark: json["landmark"],
    pincode: json["pincode"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    details: json["details"],
    status: json["status"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    fullAddress: json["full_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "name": name,
    "mobile": mobile,
    "alternate_mobile": alternateMobile,
    "address_line1": addressLine1,
    "address_line2": addressLine2,
    "locality": locality,
    "landmark": landmark,
    "pincode": pincode,
    "city": city,
    "state": state,
    "country": country,
    "details": details,
    "status": status,
    "latitude": latitude,
    "longitude": longitude,
    "full_address": fullAddress,
  };
}
