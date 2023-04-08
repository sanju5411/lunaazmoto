
import 'package:lunaaz_moto/models/customer/packages/active_package.dart';

class ChooseVehModel {
  ChooseVehModel({
    this.status,
    this.activePackage,
  });

  String? status;
  ActivePackage? activePackage;

  factory ChooseVehModel.fromJson(Map<String, dynamic> json) => ChooseVehModel(
    status: json["status"],
    activePackage: ActivePackage.fromJson(json["active_package"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "active_package": activePackage?.toJson(),
  };
}