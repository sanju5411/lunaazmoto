

import 'package:lunaaz_moto/models/customer/active_packages/active_available_benfit.dart';

class ActivePackages {
  ActivePackages({
    this.activePackId,
    this.activeVehicleType,
    this.activeAvailableBenefits,
    this.activePackDescription,
    this.activeStartDate,
    this.activeEndDate,
    this.activeStatus,
  });

  int? activePackId;
  String? activeVehicleType;
  List<ActiveAvailableBenefit>? activeAvailableBenefits;
  String? activePackDescription;
  String? activeStartDate;
  String? activeEndDate;
  String? activeStatus;

  factory ActivePackages.fromJson(Map<String, dynamic> json) => ActivePackages(
    activePackId: json["active_pack_id"],
    activeVehicleType: json["active_vehicle_type"],
    activeAvailableBenefits: List<ActiveAvailableBenefit>.from(json["active_available_benefits"].map((x) => ActiveAvailableBenefit.fromJson(x))),
    activePackDescription: json["active_pack_description"],
    activeStartDate: json["active_start_date"],
    activeEndDate: json["active_end_date"],
    activeStatus: json["active_status"],
  );

  Map<String, dynamic> toJson() => {
    "active_pack_id": activePackId,
    "active_vehicle_type": activeVehicleType,
    "active_available_benefits": activeAvailableBenefits == null ? activeAvailableBenefits : List<ActiveAvailableBenefit>.from(activeAvailableBenefits!.map((x) => x.toJson())),
    "active_pack_description": activePackDescription,
    "active_start_date": activeStartDate,
    "active_end_date": activeEndDate,
    "active_status": activeStatus,
  };
}
