import 'package:lunaaz_moto/models/drivers/new_services.dart';

class BookingDetailsMainModel {
  String? status;
  int? statusCode;
  String? message;
  NewServices? bookingDetail;

  BookingDetailsMainModel(
      {this.status, this.statusCode, this.message, this.bookingDetail});

  BookingDetailsMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    bookingDetail = json['booking_detail'] != null
        ? NewServices.fromJson(json['booking_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (bookingDetail != null) {
      data['booking_detail'] = bookingDetail!.toJson();
    }
    return data;
  }
}