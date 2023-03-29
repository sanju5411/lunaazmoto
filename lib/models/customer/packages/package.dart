import 'package:lunaaz_moto/models/customer/packages/package_bennefit.dart';

class Package {
  Package({
    this.packageId,
    this.packageName,
    this.packageType,
    this.packagePrice,
    this.packageDuration,
    this.packageStatus,
    this.packageFeaturesName,
    this.packageBenefits,
  });

  int? packageId;
  String? packageName;
  String? packageType;
  String? packagePrice;
  String? packageDuration;
  String? packageStatus;
  String? packageFeaturesName;
  List<PackageBenefit>? packageBenefits;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageId: json["package_id"],
    packageName: json["package_name"],
    packageType: json["package_type"],
    packagePrice: json["package_price"],
    packageDuration: json["package_duration"],
    packageStatus: json["package_status"],
    packageFeaturesName: json["package_features_name"],
    packageBenefits: json["package_benefits"] == null ? null : List<PackageBenefit>.from(json["package_benefits"].map((x) => PackageBenefit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "package_name": packageName,
    "package_type": packageType,
    "package_price": packagePrice,
    "package_duration": packageDuration,
    "package_status": packageStatus,
    "package_features_name": packageFeaturesName,
    "package_benefits": packageBenefits == null ? null : List<dynamic>.from(packageBenefits!.map((x) => x.toJson())),
  };
}