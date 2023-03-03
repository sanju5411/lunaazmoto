import 'package:lunaaz_moto/models/auth/user/user.dart';

class Register {
  Register({
    this.user,
    this.token,
    this.status,
    this.message,
  });

  AuthUser? user;
  String? token;
  String? status;
  String? message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        user: json["user"] == null ? null : AuthUser.fromJson(json["user"]),
        token: json["token"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "token": token,
        "status": status,
        "message": message,
      };
}
