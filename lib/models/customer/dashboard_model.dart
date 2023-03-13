import 'package:lunaaz_moto/models/customer/banner/banner_image.dart';
import 'package:lunaaz_moto/models/customer/happy_customer/happy_customer.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';

class Dashboard {
  Dashboard({
    this.status,
    this.message,
    this.happyCustomers,
    this.banners,
    this.serviceModel,
    this.todayBookings,
    this.totalBookings,
  });

  String? status;
  String? message;

  List<HappyCustomer>? happyCustomers;
  List<BannerImage>? banners;
  List<ServiceModel>? serviceModel;

  int? totalBookings;
  int? todayBookings;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],
    todayBookings: json["today_bookings"],
    totalBookings: json["total_bookings"],

    happyCustomers: json["happy_customers"] == null
        ? null
        : List<HappyCustomer>.from(
        json["happy_customers"].map((x) => HappyCustomer.fromJson(x))),
    banners: json["banners"] == null
        ? null
        : List<BannerImage>.from(
        json["banners"].map((x) => BannerImage.fromJson(x))),

    serviceModel: json["last_services"] == null
          ? null
          : List<ServiceModel>.from(
          json["last_services"].map((x) => ServiceModel.fromJson(x))),


  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "today_bookings" : todayBookings ,
    "total_bookings" : totalBookings,
    "happy_customers": happyCustomers == null
        ? null
        : List<HappyCustomer>.from(happyCustomers!.map((x) => x.toJson())),
    "banners": banners == null
        ? null
        : List<BannerImage>.from(banners!.map((x) => x.toJson())),
    "last_service": serviceModel == null
        ? null
        : List<ServiceModel>.from(serviceModel!.map((x) => x.toJson())),
  };
}
