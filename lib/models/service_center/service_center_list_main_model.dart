import 'package:lunaaz_moto/models/service_center/service_centers.dart';

class ServiceCenterListMainModel {
  String? status;
  int? statusCode;
  String? message;
  List<ServiceCenters>? serviceCenters;

  ServiceCenterListMainModel(
      {this.status, this.statusCode, this.message, this.serviceCenters});

  ServiceCenterListMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['service_centers'] != null) {
      serviceCenters = <ServiceCenters>[];
      json['service_centers'].forEach((v) {
        serviceCenters!.add(ServiceCenters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (serviceCenters != null) {
      data['service_centers'] =
          serviceCenters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}