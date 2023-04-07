import 'dart:convert';

import 'package:lunaaz_moto/models/drivers/new_services.dart';

class ServiceCentersMainModel {
  String? status;
  String? message;
  int? newServices;
  int? totalServices;
  int? inProccessServices;
  int? completedServices;
  int? todayRejectedServices;
  List<NewServices>? nextServices;

  ServiceCentersMainModel({
        this.status,
        this.message,
        this.newServices,
        this.totalServices,
        this.inProccessServices,
        this.completedServices,
        this.todayRejectedServices,
        this.nextServices});

  ServiceCentersMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    newServices = json['new_services'];
    totalServices = json['total_services'];
    inProccessServices = json['in_proccess_services'];
    completedServices = json['completed_services'];
    todayRejectedServices = json['today_rejected_services'];
    if (json['next_services'] != null) {
      nextServices = <NewServices>[];
      json['next_services'].forEach((v) {
        nextServices!.add(NewServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    data['new_services'] = newServices;
    data['total_services'] = totalServices;
    data['in_proccess_services'] = inProccessServices;
    data['completed_services'] = completedServices;
    data['today_rejected_services'] = todayRejectedServices;
    if (nextServices != null) {
      data['next_services'] =
          nextServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
