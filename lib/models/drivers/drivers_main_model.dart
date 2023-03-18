import 'new_services.dart';

class DriverMainModel {
String? status;
String? message;
List<NewServices>? newServices;
int? todayBookings;
int? totalBookings;

DriverMainModel(
    {this.status,
      this.message,
      this.newServices,
      this.todayBookings,
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
  totalBookings = json['total_bookings'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['status'] = status;
  data['message'] = message;
  if (newServices != null) {
    data['new_services'] = newServices!.map((v) => v.toJson()).toList();
  }
  data['today_bookings'] = todayBookings;
  data['total_bookings'] = totalBookings;
  return data;
}
}
