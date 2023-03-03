class LoginCheck {
  LoginCheck({
    this.status,
    this.userTypes,
  });

  String? status;
  List<String>? userTypes;

  factory LoginCheck.fromJson(Map<String, dynamic> json) => LoginCheck(
        status: json["status"],
        userTypes: json['user_types'] == null
            ? null
            : List<String>.from(json["user_types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user_types": userTypes == null
            ? null
            : List<String>.from(userTypes!.map((x) => x)),
      };
}
