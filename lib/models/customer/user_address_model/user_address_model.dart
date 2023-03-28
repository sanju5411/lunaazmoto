class AuthAddress {
  String? status;
  String? message;
  List<Addresses>? addresses;

  AuthAddress({this.status, this.message, this.addresses});

  AuthAddress.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
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
  Null? details;
  String? status;
  Null? latitude;
  Null? longitude;
  String? fullAddress;

  Addresses(
      {this.id,
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
        this.fullAddress});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    locality = json['locality'];
    landmark = json['landmark'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    details = json['details'];
    status = json['status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    fullAddress = json['full_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['alternate_mobile'] = this.alternateMobile;
    data['address_line1'] = this.addressLine1;
    data['address_line2'] = this.addressLine2;
    data['locality'] = this.locality;
    data['landmark'] = this.landmark;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['details'] = this.details;
    data['status'] = this.status;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['full_address'] = this.fullAddress;
    return data;
  }
}
