import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';

class PackagesMainModel{
  String? status;
  String? message;
  List<Package>? packages;

  PackagesMainModel({

    this.status,
    this.message,
    this.packages

  });

  PackagesMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['packages'] != null) {
      packages = <Package>[];
      json['packages'].forEach((v) {
        packages!.add(Package.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}