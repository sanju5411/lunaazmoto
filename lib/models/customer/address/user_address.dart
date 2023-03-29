class UserAddress {
  UserAddress({
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
  String? latitude;
  String? longitude;
  String? fullAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
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