import 'package:lunaaz_moto/models/customer/packages/package_bennefit.dart';

class ActivePackage {
  ActivePackage({
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
  List<PackageBenefit>? activeAvailableBenefits;
  String? activePackDescription;
  String? activeStartDate;
  String? activeEndDate;
  String? activeStatus;

  factory ActivePackage.fromJson(Map<String, dynamic> json) => ActivePackage(
    activePackId: json["active_pack_id"],
    activeVehicleType: json["active_vehicle_type"],
    activeAvailableBenefits: json["active_available_benefits"] == null ? null :List<PackageBenefit>.from(json["active_available_benefits"].map((x) => PackageBenefit.fromJson(x))),
    activePackDescription: json["active_pack_description"],
    activeStartDate: json["active_start_date"],
    activeEndDate: json["active_end_date"],
    activeStatus: json["active_status"],
  );

  Map<String, dynamic> toJson() => {
    "active_pack_id": activePackId,
    "active_vehicle_type": activeVehicleType,
    "active_available_benefits": activeAvailableBenefits == null ? null :List<PackageBenefit>.from(activeAvailableBenefits!.map((x) => x.toJson())),
    "active_pack_description": activePackDescription,
    "active_start_date": activeStartDate,
    "active_end_date": activeEndDate,
    "active_status": activeStatus,
  };
}