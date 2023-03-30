import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_color_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';

class PackagesMainModel{
  String? status;
  String? message;
  List<Package>? packages;
  List<PackageColor>? packageColor;


  PackagesMainModel({

    this.status,
    this.message,
    this.packages,
    this.packageColor,

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
    if(json['package_color'] != null){
      packageColor = List<PackageColor>.from(json["package_color"].map((x) => PackageColor.fromJson(x)));
    }



  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
      data["package_color"] = List<dynamic>.from(packageColor!.map((x) => x.toJson()));

    return data;
  }

}