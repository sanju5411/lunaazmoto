import 'package:lunaaz_moto/models/user_addressModel/user_address_model.dart';

import '../auth/user/user.dart';
import '../customer/service_model/package_model/package_model.dart';

class NewServices {
  int? bookingId;
  AuthUser? bookingUser;
  AuthUser? bookingDriver;
  UserAddress? bookingAddress;
  BookingPackage? bookingPackage;
  var bookingCenter;
  String? bookingNumber;
  String? bookingDate;
  String? bookedDate;
  String? bookedTime;
  String? bookingVehName;
  String? bookingVehNum;
  String? bookingVehType;
  String? bookingInstruct;
  String? bookingAcceptedAt;
  String? bookingProccessedAt;
  String? bookingPickedAt;
  String? bookingCompletedAt;
  String? bookingRejectedAt;
  String? bookingPaymentMethod;
  String? bookingPaymentDetail;
  String? bookingPaymentStatus;
  String? bookingReview;
  String? bookingRating;
  String? bookingStatus;
  String? status;

  NewServices(
      {this.bookingId,
        this.bookingUser,
        this.bookingDriver,
        this.bookingAddress,
        this.bookingPackage,
        this.bookingCenter,
        this.bookingNumber,
        this.bookingDate,
        this.bookedDate,
        this.bookedTime,
        this.bookingVehName,
        this.bookingVehNum,
        this.bookingVehType,
        this.bookingInstruct,
        this.bookingAcceptedAt,
        this.bookingProccessedAt,
        this.bookingPickedAt,
        this.bookingCompletedAt,
        this.bookingRejectedAt,
        this.bookingPaymentMethod,
        this.bookingPaymentDetail,
        this.bookingPaymentStatus,
        this.bookingReview,
        this.bookingRating,
        this.bookingStatus,
      this.status});

  NewServices.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingUser = json['booking_user'] != null
        ? AuthUser.fromJson(json['booking_user'])
        : null;

    bookingDriver = json['booking_driver'] != null
        ? AuthUser.fromJson(json['booking_driver'])
        : null;

    bookingAddress = json['booking_address']!= null
        ? new UserAddress.fromJson(json['booking_address'])
        : null;

    bookingAddress = json['booking_address'] != null ? UserAddress.fromJson(json['booking_address']): null;
    bookingPackage = json['booking_package'] != null
        ? BookingPackage.fromJson(json['booking_package'])
        : null;
    bookingCenter = json['booking_center'];
    bookingNumber = json['booking_number'];
    bookingDate = json['booking_date'];
    bookedDate = json['booked_date'];
    bookedTime = json['booked_time'];
    bookingVehName = json['booking_veh_name'];
    bookingVehNum = json['booking_veh_num'];
    bookingVehType = json['booking_veh_type'];
    bookingInstruct = json['booking_instruct'];
    bookingAcceptedAt = json['booking_accepted_at'];
    bookingProccessedAt = json['booking_proccessed_at'];
    bookingPickedAt = json['booking_picked_at'];
    bookingCompletedAt = json['booking_completed_at'];
    bookingRejectedAt = json['booking_rejected_at'];
    bookingPaymentMethod = json['booking_payment_method'];
    bookingPaymentDetail = json['booking_payment_detail'];
    bookingPaymentStatus = json['booking_payment_status'];
    bookingReview = json['booking_review'];
    bookingRating = json['booking_rating'];
    bookingStatus = json['booking_status'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['booking_id'] = bookingId;
    if (bookingUser != null) {
      data['booking_user'] = bookingUser!.toJson();
    }
    if(bookingDriver != null){
      data['booking_driver'] = bookingDriver!.toJson();
    }
    if(bookingAddress != null){
      data['booking_address'] = bookingAddress;
    }
    if (bookingPackage != null) {
      data['booking_package'] = bookingPackage!.toJson();
    }
    data['booking_center'] = bookingCenter;
    data['booking_number'] = bookingNumber;
    data['booking_date'] = bookingDate;
    data['booked_date'] = bookedDate;
    data['booked_time'] = bookedTime;
    data['booking_veh_name'] = bookingVehName;
    data['booking_veh_num'] = bookingVehNum;
    data['booking_veh_type'] = bookingVehType;
    data['booking_instruct'] = bookingInstruct;
    data['booking_accepted_at'] = bookingAcceptedAt;
    data['booking_proccessed_at'] = bookingProccessedAt;
    data['booking_picked_at'] = bookingPickedAt;
    data['booking_completed_at'] = bookingCompletedAt;
    data['booking_rejected_at'] = bookingRejectedAt;
    data['booking_payment_method'] = bookingPaymentMethod;
    data['booking_payment_detail'] = bookingPaymentDetail;
    data['booking_payment_status'] = bookingPaymentStatus;
    data['booking_review'] = bookingReview;
    data['booking_rating'] = bookingRating;
    data['booking_status'] = bookingStatus;
    data['status'] = status;
    return data;
  }
}