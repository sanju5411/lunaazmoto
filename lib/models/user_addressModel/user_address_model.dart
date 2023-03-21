class UserAddress {
  int? id;
  String? userId;
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
  Null? location;
  String? latitude;
  String? longitude;
  Null? details;
  String? status;
  String? createdAt;
  String? updatedAt;

  UserAddress(
      {this.id,
        this.userId,
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
        this.location,
        this.latitude,
        this.longitude,
        this.details,
        this.status,
        this.createdAt,
        this.updatedAt});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
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
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    details = json['details'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['name'] = name;
    data['mobile'] = mobile;
    data['alternate_mobile'] = alternateMobile;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['locality'] = locality;
    data['landmark'] = landmark;
    data['pincode'] = pincode;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['details'] = details;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
