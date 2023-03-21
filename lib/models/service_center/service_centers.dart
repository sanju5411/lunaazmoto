import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';

class ServiceCenters {
  int? shopId;
  String? image;
  String? shopName;
  String? shopMobile;
  String? shopEmail;
  String? shopOwner;
  String? shopAlterEmail;
  String? shopAlterMobile;
  String? shopDeliveryType;
  String? shopRecommend;
  String? shopSportlight;
  String? shopPopular;
  String? shopFeatured;
  String? shopDescription;
  String? shopAddressLine1;
  String? shopAddressLine2;
  String? shopLocation;
  String? shopLandmark;
  String? shopCity;
  String? shopState;
  String? shopPostcode;
  String? shopCountry;
  String? shopLat;
  String? shopLong;
  String? shopActivityStatus;
  String? shopChangeStatusTime;
  String? shopStatus;
  String? shopCreateAt;
  String? shopDetails;
  List<ShopCategories>? shopCategories;
  String? shopAccountHolder;
  String? shopAccountNumber;
  String? shopConfirmAccountNumber;
  String? shopBankName;
  String? shopBankBranchName;
  String? shopUpi;
  String? shopIfsc;
  List<ShopDocuments>? shopDocuments;

  ServiceCenters(
      {this.shopId,
        this.image,
        this.shopName,
        this.shopMobile,
        this.shopEmail,
        this.shopOwner,
        this.shopAlterEmail,
        this.shopAlterMobile,
        this.shopDeliveryType,
        this.shopRecommend,
        this.shopSportlight,
        this.shopPopular,
        this.shopFeatured,
        this.shopDescription,
        this.shopAddressLine1,
        this.shopAddressLine2,
        this.shopLocation,
        this.shopLandmark,
        this.shopCity,
        this.shopState,
        this.shopPostcode,
        this.shopCountry,
        this.shopLat,
        this.shopLong,
        this.shopActivityStatus,
        this.shopChangeStatusTime,
        this.shopStatus,
        this.shopCreateAt,
        this.shopDetails,
        this.shopCategories,
        this.shopAccountHolder,
        this.shopAccountNumber,
        this.shopConfirmAccountNumber,
        this.shopBankName,
        this.shopBankBranchName,
        this.shopUpi,
        this.shopIfsc,
        this.shopDocuments});

  ServiceCenters.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    image = json['image'];
    shopName = json['shop_name'];
    shopMobile = json['shop_mobile'];
    shopEmail = json['shop_email'];
    shopOwner = json['shop_owner'];
    shopAlterEmail = json['shop_alter_email'];
    shopAlterMobile = json['shop_alter_mobile'];
    shopDeliveryType = json['shop_delivery_type'];
    shopRecommend = json['shop_recommend'];
    shopSportlight = json['shop_sportlight'];
    shopPopular = json['shop_popular'];
    shopFeatured = json['shop_featured'];
    shopDescription = json['shop_description'];
    shopAddressLine1 = json['shop_address_line1'];
    shopAddressLine2 = json['shop_address_line2'];
    shopLocation = json['shop_location'];
    shopLandmark = json['shop_landmark'];
    shopCity = json['shop_city'];
    shopState = json['shop_state'];
    shopPostcode = json['shop_postcode'];
    shopCountry = json['shop_country'];
    shopLat = json['shop_lat'];
    shopLong = json['shop_long'];
    shopActivityStatus = json['shop_activity_status'];
    shopChangeStatusTime = json['shop_change_status_time'];
    shopStatus = json['shop_status'];
    shopCreateAt = json['shop_create_at'];
    shopDetails = json['shop_details'];
    if (json['shop_categories'] != null) {
      shopCategories = <ShopCategories>[];
      json['shop_categories'].forEach((v) {
        shopCategories!.add(ShopCategories.fromJson(v));
      });
    }
    shopAccountHolder = json['shop_account_holder'];
    shopAccountNumber = json['shop_account_number'];
    shopConfirmAccountNumber = json['shop_confirm_account_number'];
    shopBankName = json['shop_bank_name'];
    shopBankBranchName = json['shop_bank_branch_name'];
    shopUpi = json['shop_upi'];
    shopIfsc = json['shop_ifsc'];
    if (json['shop_documents'] != null) {
      shopDocuments = <ShopDocuments>[];
      json['shop_documents'].forEach((v) {
        shopDocuments!.add(ShopDocuments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = shopId;
    data['image'] = image;
    data['shop_name'] = shopName;
    data['shop_mobile'] = shopMobile;
    data['shop_email'] = shopEmail;
    data['shop_owner'] = shopOwner;
    data['shop_alter_email'] = shopAlterEmail;
    data['shop_alter_mobile'] = shopAlterMobile;
    data['shop_delivery_type'] = shopDeliveryType;
    data['shop_recommend'] = shopRecommend;
    data['shop_sportlight'] = shopSportlight;
    data['shop_popular'] = shopPopular;
    data['shop_featured'] = shopFeatured;
    data['shop_description'] = shopDescription;
    data['shop_address_line1'] = shopAddressLine1;
    data['shop_address_line2'] = shopAddressLine2;
    data['shop_location'] = shopLocation;
    data['shop_landmark'] = shopLandmark;
    data['shop_city'] = shopCity;
    data['shop_state'] = shopState;
    data['shop_postcode'] = shopPostcode;
    data['shop_country'] = shopCountry;
    data['shop_lat'] = shopLat;
    data['shop_long'] = shopLong;
    data['shop_activity_status'] = shopActivityStatus;
    data['shop_change_status_time'] = shopChangeStatusTime;
    data['shop_status'] = shopStatus;
    data['shop_create_at'] = shopCreateAt;
    data['shop_details'] = shopDetails;
    if (shopCategories != null) {
      data['shop_categories'] =
          shopCategories!.map((v) => v.toJson()).toList();
    }
    data['shop_account_holder'] = shopAccountHolder;
    data['shop_account_number'] = shopAccountNumber;
    data['shop_confirm_account_number'] = shopConfirmAccountNumber;
    data['shop_bank_name'] = shopBankName;
    data['shop_bank_branch_name'] = shopBankBranchName;
    data['shop_upi'] = shopUpi;
    data['shop_ifsc'] = shopIfsc;
    if (shopDocuments != null) {
      data['shop_documents'] =
          shopDocuments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}