class ActivePackage {
  ActivePackage({
    required this.activePackId,
    required this.activeVehicleType,
    required this.activeAvailableBenefits,
    this.activePackDescription,
    required this.activeStartDate,
    required this.activeEndDate,
    required this.activeStatus,
  });

  int activePackId;
  String activeVehicleType;
  List<String> activeAvailableBenefits;
  dynamic activePackDescription;
  DateTime activeStartDate;
  DateTime activeEndDate;
  String activeStatus;

  factory ActivePackage.fromJson(Map<String, dynamic> json) => ActivePackage(
    activePackId: json["active_pack_id"],
    activeVehicleType: json["active_vehicle_type"],
    activeAvailableBenefits: List<String>.from(json["active_available_benefits"].map((x) => x)),
    activePackDescription: json["active_pack_description"],
    activeStartDate: DateTime.parse(json["active_start_date"]),
    activeEndDate: DateTime.parse(json["active_end_date"]),
    activeStatus: json["active_status"],
  );

  Map<String, dynamic> toJson() => {
    "active_pack_id": activePackId,
    "active_vehicle_type": activeVehicleType,
    "active_available_benefits": List<dynamic>.from(activeAvailableBenefits.map((x) => x)),
    "active_pack_description": activePackDescription,
    "active_start_date": "${activeStartDate.year.toString().padLeft(4, '0')}-${activeStartDate.month.toString().padLeft(2, '0')}-${activeStartDate.day.toString().padLeft(2, '0')}",
    "active_end_date": "${activeEndDate.year.toString().padLeft(4, '0')}-${activeEndDate.month.toString().padLeft(2, '0')}-${activeEndDate.day.toString().padLeft(2, '0')}",
    "active_status": activeStatus,
  };
}
