import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/customer/service/service.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/models/user/user.dart';
import 'package:lunaaz_moto/models/user_addressModel/user_address_model.dart';

class BookingList {
  String? status;
  int? statusCode;
  String? message;
  List<Service>? bookings;
  List<Service>? onGoingBookings;

  BookingList(
      {this.status,
        this.statusCode,
        this.message,
        this.bookings,
        this.onGoingBookings});

  BookingList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
     statusCode = json['status_code'];
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <Service>[];
      json['bookings'].forEach((v) {
        bookings!.add(Service.fromJson(v));
      });
    }
    if (json['on_going_bookings'] != null) {
      onGoingBookings = <Service>[];
      json['on_going_bookings'].forEach((v) {
        onGoingBookings!.add(Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    if (onGoingBookings != null) {
      data['on_going_bookings'] =
          onGoingBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? bookingId;
  User? bookingUser;
  UserAddress? bookingAddress;
  Package? bookingPackage;
  ServiceCenters? bookingCenter;
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

  Bookings(
      {this.bookingId,
        this.bookingUser,
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
        this.bookingStatus});

  Bookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingUser = json['booking_user'] != null || json['booking_user'] != ""
        ? User.fromJson(json['booking_user'])
        : null;
    bookingAddress = json['booking_address']  != null || json['booking_address'] != ""
        ? UserAddress.fromJson(json['booking_address'])
        : null;

    bookingPackage = json['booking_package'] != null || json['booking_package'] != ""
        ? Package.fromJson(json['booking_package'])
        : null;
    bookingCenter = json['booking_center'] != null
        ? ServiceCenters.fromJson(json['booking_center'])
        : null;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['booking_id'] = bookingId;
    if (bookingUser != null) {
      data['booking_user'] = bookingUser!.toJson();
    }
    if(bookingAddress != null){
      data['booking_address'] = bookingAddress!.toJson();
    }
    if (bookingPackage != null) {
      data['booking_package'] = bookingPackage!.toJson();
    }
    if (bookingCenter != null) {
      data['booking_center'] = bookingCenter!.toJson();
    }
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
    return data;
  }
}









class ShopCategories {
  int? categoryId;
  String? categoryName;
  String? categoryDetail;
  String? categoryStatus;

  ShopCategories(
      {this.categoryId,
        this.categoryName,
        this.categoryDetail,
        this.categoryStatus});

  ShopCategories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryDetail = json['category_detail'];
    categoryStatus = json['category_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_detail'] = categoryDetail;
    data['category_status'] = categoryStatus;
    return data;
  }
}



