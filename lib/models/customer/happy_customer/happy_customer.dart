class HappyCustomer {
  HappyCustomer({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.avatar,
    this.userType,
    this.fcmTopics,
  });

  int? id;
  String? name;
  String? countryCode;
  String? mobile;
  String? email;
  String? avatar;
  String? userType;
  List<String>? fcmTopics;

  factory HappyCustomer.fromJson(Map<String, dynamic> json) => HappyCustomer(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    email: json["email"],
    avatar: json["avatar"],
    userType: json["user_type"],
    fcmTopics: json["fcm_topics"] == null
        ? null
        : List<String>.from(json["fcm_topics"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "mobile": mobile,
    "email": email,
    "avatar": avatar,
    "user_type": userType,
    "fcm_topics": fcmTopics == null
        ? null
        : List<String>.from(fcmTopics!.map((x) => x)),
  };
}
