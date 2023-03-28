import 'package:lunaaz_moto/models/customer/active_packages/active_package.dart';
import 'package:lunaaz_moto/models/customer/banner/banner_image.dart';
import 'package:lunaaz_moto/models/customer/happy_customer/happy_customer.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';

class Dashboard {
  Dashboard({
     this.status,
    this.message,
    this.banners,
    this.happyCustomers,
     this.activePackages,
    this.todayBookings,
     this.serviceModel,
    this.totalBookings,
   // required this.popularPackage,
  });

  String? status;
  String? message;

   List<HappyCustomer>? happyCustomers;
  List<BannerImage>? banners;
 List<ServiceModel>? serviceModel;
 List<ActivePackage>? activePackages;
 //List<ServiceModel>? popularPackage;

  int? totalBookings;
  int? todayBookings;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],
    todayBookings: json["today_bookings"],
    totalBookings: json["total_bookings"],

    activePackages: json["active_packages"] == null || json["active_packages"] == ""
        ? null
        : List<ActivePackage>.from(json["active_packages"].map((x) => ActivePackage.fromJson(x))),

    happyCustomers: json["happy_customers"] == null || json["happy_customers"] == ""
        ? null
        : List<HappyCustomer>.from(
        json["happy_customers"].map((x) => HappyCustomer.fromJson(x))),
    banners: json["banners"] == null
        ? null
        : List<BannerImage>.from(
        json["banners"].map((x) => BannerImage.fromJson(x))),

    serviceModel: json["last_services"] == null || json["last_services"] == ""
        ? null
          : List<ServiceModel>.from(
          json["last_services"].map((x) => ServiceModel.fromJson(x))),


  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "today_bookings" : todayBookings,
    "total_bookings" : totalBookings,

    "active_packages": activePackages == null || activePackages == ""
        ? null
        : List<ActivePackage>.from(activePackages!.map((x) => x.toJson())),

    "happy_customers": happyCustomers == null
        ? null
        : List<HappyCustomer>.from(happyCustomers!.map((x) => x.toJson())),
    "banners": banners == null
        ? null
        : List<BannerImage>.from(banners!.map((x) => x.toJson())),
    "last_service": serviceModel == null || serviceModel == ""
        ? null
        : List<ServiceModel>.from(serviceModel!.map((x) => x.toJson())),
  };
}
