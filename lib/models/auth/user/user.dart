class AuthUser {
  AuthUser({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.email,
    this.avatar,
    this.dateOfBirth,
    this.userType,
    this.fcmTopics,
  });

  int? id;
  String? name;
  String? countryCode;
  String? mobile;
  String? email;
  String? avatar;
  String? dateOfBirth;
  String? userType;
  List<String>? fcmTopics;

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        email: json["email"],
        avatar: json["avatar"],
        dateOfBirth: json["date_of_birth"],
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
        "date_of_birth": dateOfBirth,
        "user_type": userType,
        "fcm_topics": fcmTopics == null
            ? null
            : List<String>.from(fcmTopics!.map((x) => x)),
      };
}
