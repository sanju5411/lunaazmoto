import 'package:lunaaz_moto/models/profile/user_data.dart';

class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.user,
  });

  String? status;
  String? message;
  UserData? user;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user == null ? null : user!.toJson(),
      };
}
