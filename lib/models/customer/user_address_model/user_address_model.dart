class AuthAddress {
  AuthAddress({
    this.status,
    this.message,
    this.addresses,
    this.userAddress,
  });

  String? status;
  String? message;
  List<Address>? addresses;
  Address? userAddress;

  factory AuthAddress.fromJson(Map<String, dynamic> json) => AuthAddress(
    status: json["status"],
    message: json["message"],
    addresses: json["addresses"] == null  ? null : List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    userAddress: json['user_address'] == null ? null : Address.fromJson(json["user_address"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "addresses": addresses == null ? null : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "user_address": userAddress == null ? null : userAddress!.toJson(),
  };
}

class Address {
  Address({
    this.id,
    this.title,
    this.name,
    this.mobile,
    this.alternateMobile,
    this.addressLine1,
    this.addressLine2,
    this.locality,
    this.landmark,
    this.pincode,
    this.city,
    this.state,
    this.country,
    this.details,
    this.status,
    this.latitude,
    this.longitude,
    this.fullAddress,
  });

  int? id;
  String? title;
  String? name;
  String? mobile;
  String? alternateMobile;
  String? addressLine1;
  String? addressLine2;
  String? locality;
  String? landmark;
  String? pincode;
  String? city;
  String? state;
  String? country;
  dynamic details;
  String? status;
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
