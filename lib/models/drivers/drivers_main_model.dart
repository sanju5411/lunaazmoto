import 'new_services.dart';

class DriverMainModel {
  String? status;
  String? message;
  List<NewServices>? newServices;
  int? todayBookings;
  int? todayPickedBookings;
  int? todayDeliveredBookings;
  int? totalBookings;

  DriverMainModel(
      {this.status,
        this.message,
        this.newServices,
        this.todayBookings,
        this.todayPickedBookings,
        this.todayDeliveredBookings,
        this.totalBookings});

  DriverMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['new_services'] != null) {
      newServices = <NewServices>[];
      json['new_services'].forEach((v) {
        newServices!.add(NewServices.fromJson(v));
      });
    }
    todayBookings = json['today_bookings'];
    todayPickedBookings = json['today_picked_bookings'];
    todayDeliveredBookings = json['today_delivered_bookings'];
    totalBookings = json['total_bookings'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (newServices != null) {
      data['new_services'] = newServices!.map((v) => v.toJson()).toList();
    }
    data['today_bookings'] = todayBookings;
    data['today_picked_bookings'] = todayPickedBookings;
    data['today_delivered_bookings'] = todayDeliveredBookings;
    data['total_bookings'] = totalBookings;
    return data;
  }

}
