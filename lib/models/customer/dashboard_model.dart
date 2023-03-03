import 'package:lunaaz_moto/models/customer/banner/banner_image.dart';
import 'package:lunaaz_moto/models/customer/happy_customer/happy_customer.dart';

class Dashboard {
  Dashboard({
    this.status,
    this.message,
    this.happyCustomers,
    this.banners,
  });

  String? status;
  String? message;

  List<HappyCustomer>? happyCustomers;
  List<BannerImage>? banners;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],

    happyCustomers: json["happy_customers"] == null
        ? null
        : List<HappyCustomer>.from(
        json["happy_customers"].map((x) => HappyCustomer.fromJson(x))),
    banners: json["banners"] == null
        ? null
        : List<BannerImage>.from(
        json["banners"].map((x) => BannerImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "happy_customers": happyCustomers == null
        ? null
        : List<HappyCustomer>.from(happyCustomers!.map((x) => x.toJson())),
    "banners": banners == null
        ? null
        : List<BannerImage>.from(banners!.map((x) => x.toJson())),
  };
}
