import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';

class BookingPackage {
  int? packageId;
  String? packageName;
  String? packageType;
  String? packagePrice;
  String? packageDuration;
  String? packageStatus;
  String? packageFeaturesName;
  List<PackageBenefits>? packageBenefits;

  BookingPackage(
      {this.packageId,
        this.packageName,
        this.packageType,
        this.packagePrice,
        this.packageDuration,
        this.packageStatus,
        this.packageFeaturesName,
        this.packageBenefits});

  BookingPackage.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packageType = json['package_type'];
    packagePrice = json['package_price'];
    packageDuration = json['package_duration'];
    packageStatus = json['package_status'];
    packageFeaturesName = json['package_features_name'];
    if (json['package_benefits'] != null) {
      packageBenefits = <PackageBenefits>[];
      json['package_benefits'].forEach((v) {
        packageBenefits!.add(new PackageBenefits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['package_type'] = this.packageType;
    data['package_price'] = this.packagePrice;
    data['package_duration'] = this.packageDuration;
    data['package_status'] = this.packageStatus;
    data['package_features_name'] = this.packageFeaturesName;
    if (this.packageBenefits != null) {
      data['package_benefits'] =
          this.packageBenefits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}