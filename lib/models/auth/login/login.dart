import 'package:lunaaz_moto/models/auth/user/user.dart';

class Login {
  Login({
    this.user,
    this.token,
    this.status,
    this.message,
    this.otp,
  });

  AuthUser? user;
  String? token;
  String? status;
  String? message;
  String? otp;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        user: json["user"] == null ? null : AuthUser.fromJson(json["user"]),
        token: json["token"],
        status: json["status"],
        message: json["message"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token,
        "status": status,
        "message": message,
        "otp": otp,
      };
}
