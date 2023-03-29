import 'package:lunaaz_moto/models/customer/address/user_address.dart';
import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/models/user/user.dart';

class Service {
  Service({
    this.bookingId,
    this.bookingUser,
    this.bookingAddress,
    this.bookingPackage,
    this.bookingCenter,
    this.bookingDriver,
    this.bookingNumber,
    this.bookingDate,
    this.bookedDate,
    this.bookedTime,
    this.bookingVehName,
    this.bookingVehNum,
    this.bookingVehType,
    this.bookingInstructions,
    this.bookingAcceptedAt,
    this.bookingRejectedAt,
    this.bookingCancelledAt,
    this.bookingPickedAt,
    this.bookingDroppedAtVendorAt,
    this.bookingProccessedAt,
    this.bookingServiceCompletedAt,
    this.bookingPickedAtVendorAt,
    this.bookingCompletedAt,
    this.bookingPaymentMethod,
    this.bookingPaymentDetail,
    this.bookingPaymentStatus,
    this.bookingReview,
    this.bookingRating,
    this.bookingUrl,
    this.bookingStatus,
  });

  int? bookingId;
  User? bookingUser;
  UserAddress? bookingAddress;
  Package? bookingPackage;
  ServiceCenters? bookingCenter;
  User? bookingDriver;
  String? bookingNumber;
  String? bookingDate;
  String? bookedDate;
  String? bookedTime;
  String? bookingVehName;
  String? bookingVehNum;
  String? bookingVehType;
  String? bookingInstructions;
  String? bookingAcceptedAt;
  String? bookingRejectedAt;
  String? bookingCancelledAt;
  String? bookingPickedAt;
  String? bookingDroppedAtVendorAt;
  String? bookingProccessedAt;
  String? bookingServiceCompletedAt;
  String? bookingPickedAtVendorAt;
  String? bookingCompletedAt;
  String? bookingPaymentMethod;
  dynamic bookingPaymentDetail;
  String? bookingPaymentStatus;
  String? bookingReview;
  String? bookingRating;
  String? bookingUrl;
  String? bookingStatus;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    bookingId: json["booking_id"],
    bookingUser: json["booking_user"] == null ? null : User.fromJson(json["booking_user"]),
    bookingAddress: json["booking_address"] == null ? null : UserAddress.fromJson(json["booking_address"]),
    bookingPackage: json["booking_package"] == null ? null : Package.fromJson(json["booking_package"]),
    bookingCenter: json["booking_center"] == null ? null : ServiceCenters.fromJson(json["booking_center"]),
    bookingDriver: json["booking_driver"] == null ? null : User.fromJson(json["booking_driver"]),
    bookingNumber: json["booking_number"],
    bookingDate: json["booking_date"],
    bookedDate: json["booked_date"],
    bookedTime: json["booked_time"],
    bookingVehName: json["booking_veh_name"],
    bookingVehNum: json["booking_veh_num"],
    bookingVehType: json["booking_veh_type"],
    bookingInstructions: json["booking_instructions"],
    bookingAcceptedAt: json["booking_accepted_at"],
    bookingRejectedAt: json["booking_rejected_at"],
    bookingCancelledAt: json["booking_cancelled_at"],
    bookingPickedAt: json["booking_picked_at"],
    bookingDroppedAtVendorAt: json["booking_dropped_at_vendor_at"],
    bookingProccessedAt: json["booking_proccessed_at"],
    bookingServiceCompletedAt: json["booking_service_completed_at"],
    bookingPickedAtVendorAt: json["booking_picked_at_vendor_at"],
    bookingCompletedAt: json["booking_completed_at"],
    bookingPaymentMethod: json["booking_payment_method"],
    bookingPaymentDetail: json["booking_payment_detail"],
    bookingPaymentStatus: json["booking_payment_status"],
    bookingReview: json["booking_review"],
    bookingRating: json["booking_rating"],
    bookingUrl: json["booking_url"],
    bookingStatus: json["booking_status"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "booking_user": bookingUser!.toJson(),
    "booking_address": bookingAddress == null ? null : bookingAddress!.toJson(),
    "booking_package": bookingPackage == null ? null : bookingPackage!.toJson(),
    "booking_center": bookingCenter == null ? null : bookingCenter!.toJson(),
    "booking_driver": bookingDriver == null ? null : bookingDriver!.toJson(),
    "booking_number": bookingNumber,
    "booking_date": bookingDate,
    "booked_date": bookedDate,
    "booked_time": bookedTime,
    "booking_veh_name": bookingVehName,
    "booking_veh_num": bookingVehNum,
    "booking_veh_type": bookingVehType,
    "booking_instructions": bookingInstructions,
    "booking_accepted_at": bookingAcceptedAt,
    "booking_rejected_at": bookingRejectedAt,
    "booking_cancelled_at": bookingCancelledAt,
    "booking_picked_at": bookingPickedAt,
    "booking_dropped_at_vendor_at": bookingDroppedAtVendorAt,
    "booking_proccessed_at": bookingProccessedAt,
    "booking_service_completed_at": bookingServiceCompletedAt,
    "booking_picked_at_vendor_at": bookingPickedAtVendorAt,
    "booking_completed_at": bookingCompletedAt,
    "booking_payment_method": bookingPaymentMethod,
    "booking_payment_detail": bookingPaymentDetail,
    "booking_payment_status": bookingPaymentStatus,
    "booking_review": bookingReview,
    "booking_rating": bookingRating,
    "booking_url": bookingUrl,
    "booking_status": bookingStatus,
  };
}