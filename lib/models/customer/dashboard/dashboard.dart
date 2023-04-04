import 'package:lunaaz_moto/models/customer/dashboard/banner.dart';
import 'package:lunaaz_moto/models/customer/dashboard/happy_customer.dart';
import 'package:lunaaz_moto/models/customer/packages/active_package.dart';
import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/customer/service/service.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/user/user.dart';

class Dashboard {
  Dashboard({
    this.status,
    this.message,
    this.banners,
    this.happyCustomers,
    this.activePackages,
    this.todayBookings,
    this.lastServices,
    this.totalBookings,
    this.popularPackage,
  });

  String? status;
  String? message;
  List<DashboardBanner>? banners;
  List<User>? happyCustomers;
  int? todayBookings;
  List<Service>? lastServices;
  int? totalBookings;
  List<ActivePackage>? activePackages;
  Package? popularPackage;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
    status: json["status"],
    message: json["message"],
    banners: json["banners"] == null? null : List<DashboardBanner>.from(json["banners"].map((x) => DashboardBanner.fromJson(x))),
    happyCustomers: json["happy_customers"] == null ? null : List<User>.from(json["happy_customers"].map((x) => User.fromJson(x))),
    activePackages: json["active_packages"] == null ? null : List<ActivePackage>.from(json["active_packages"].map((x) => ActivePackage.fromJson(x))),
    todayBookings: json["today_bookings"],
    lastServices: json["last_services"] == null ? null : List<Service>.from(json["last_services"].map((x) => Service.fromJson(x))),
    totalBookings: json["total_bookings"],
    popularPackage: Package.fromJson(json["popular_package"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "banners": banners == null ? null : List<DashboardBanner>.from(banners!.map((x) => x.toJson())),
    "happy_customers": happyCustomers == null ? null : List<HappyCustomer>.from(happyCustomers!.map((x) => x.toJson())),
    "active_packages": activePackages == null ? null : List<ActivePackage>.from(activePackages!.map((x) => x.toJson())),
    "today_bookings": todayBookings,
    "last_services": lastServices == null ? null : List<Service>.from(lastServices!.map((x) => x.toJson())),
    "total_bookings": totalBookings,
    "popular_package": popularPackage!.toJson(),
  };
}
