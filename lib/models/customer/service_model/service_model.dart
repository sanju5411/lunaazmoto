import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';

class ServiceModel {
  int? bookingId;
  BookingUser? bookingUser;
  String? bookingAddress;
  BookingPackage? bookingPackage;
  BookingCenter? bookingCenter;
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

  ServiceModel(
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

  ServiceModel.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingUser = json['booking_user'] != null
        ? new BookingUser.fromJson(json['booking_user'])
        : null;
    bookingAddress = json['booking_address'];
    bookingPackage = json['booking_package'] != null
        ? BookingPackage.fromJson(json['booking_package'])
        : null;
    bookingCenter = json['booking_center'] != null
        ? BookingCenter.fromJson(json['booking_center'])
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['booking_id'] = bookingId;
    if (bookingUser != null) {
      data['booking_user'] = bookingUser!.toJson();
    }
    data['booking_address'] = bookingAddress;
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

class BookingUser {
  int? id;
  String? name;
  String? countryCode;
  String? mobile;
  String? email;
  String? avatar;
  String? userType;
  List<String>? fcmTopics;

  BookingUser(
      {this.id,
        this.name,
        this.countryCode,
        this.mobile,
        this.email,
        this.avatar,
        this.userType,
        this.fcmTopics});

  BookingUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    email = json['email'];
    avatar = json['avatar'];
    userType = json['user_type'];
    fcmTopics = json['fcm_topics'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['email'] = email;
    data['avatar'] = avatar;
    data['user_type'] = userType;
    data['fcm_topics'] = fcmTopics;
    return data;
  }
}



class PackageBenefits {
  String? name;
  String? limit;

  PackageBenefits({this.name, this.limit});

  PackageBenefits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['limit'] = limit;
    return data;
  }
}

class BookingCenter {
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

  BookingCenter(
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

  BookingCenter.fromJson(Map<String, dynamic> json) {
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
        shopCategories!.add(new ShopCategories.fromJson(v));
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
        shopDocuments!.add(new ShopDocuments.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_detail'] = categoryDetail;
    data['category_status'] = categoryStatus;
    return data;
  }
}

class ShopDocuments {
  int? id;
  String? userId;
  String? name;
  String? file;
  String? createdAt;
  String? updatedAt;

  ShopDocuments(
      {this.id,
        this.userId,
        this.name,
        this.file,
        this.createdAt,
        this.updatedAt});

  ShopDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['file'] = file;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
