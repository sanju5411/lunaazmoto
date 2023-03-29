import 'new_services.dart';

class BookingListMainModel {
  String? status;
  int? statusCode;
  String? message;
  List<NewServices>? bookings;

  BookingListMainModel(
      {this.status, this.statusCode, this.message, this.bookings});

  BookingListMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <NewServices>[];
      json['bookings'].forEach((v) {
        bookings!.add(NewServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}