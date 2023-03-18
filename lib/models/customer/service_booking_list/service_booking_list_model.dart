class BookingList {
  String? status;
  int? statusCode;
  String? message;
  List<Bookings>? bookings;
  List<OnGoingBookings>? onGoingBookings;

  BookingList(
      {this.status,
        this.statusCode,
        this.message,
        this.bookings,
        this.onGoingBookings});

  BookingList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
    if (json['on_going_bookings'] != null) {
      onGoingBookings = <OnGoingBookings>[];
      json['on_going_bookings'].forEach((v) {
        onGoingBookings!.add(new OnGoingBookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    if (this.onGoingBookings != null) {
      data['on_going_bookings'] =
          this.onGoingBookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? bookingId;
  BookingUser? bookingUser;
  Null? bookingAddress;
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

  Bookings(
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

  Bookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingUser = json['booking_user'] != null
        ? new BookingUser.fromJson(json['booking_user'])
        : null;
    bookingAddress = json['booking_address'];
    bookingPackage = json['booking_package'] != null
        ? new BookingPackage.fromJson(json['booking_package'])
        : null;
    bookingCenter = json['booking_center'] != null
        ? new BookingCenter.fromJson(json['booking_center'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    if (this.bookingUser != null) {
      data['booking_user'] = this.bookingUser!.toJson();
    }
    data['booking_address'] = this.bookingAddress;
    if (this.bookingPackage != null) {
      data['booking_package'] = this.bookingPackage!.toJson();
    }
    if (this.bookingCenter != null) {
      data['booking_center'] = this.bookingCenter!.toJson();
    }
    data['booking_number'] = this.bookingNumber;
    data['booking_date'] = this.bookingDate;
    data['booked_date'] = this.bookedDate;
    data['booked_time'] = this.bookedTime;
    data['booking_veh_name'] = this.bookingVehName;
    data['booking_veh_num'] = this.bookingVehNum;
    data['booking_veh_type'] = this.bookingVehType;
    data['booking_instruct'] = this.bookingInstruct;
    data['booking_accepted_at'] = this.bookingAcceptedAt;
    data['booking_proccessed_at'] = this.bookingProccessedAt;
    data['booking_picked_at'] = this.bookingPickedAt;
    data['booking_completed_at'] = this.bookingCompletedAt;
    data['booking_rejected_at'] = this.bookingRejectedAt;
    data['booking_payment_method'] = this.bookingPaymentMethod;
    data['booking_payment_detail'] = this.bookingPaymentDetail;
    data['booking_payment_status'] = this.bookingPaymentStatus;
    data['booking_review'] = this.bookingReview;
    data['booking_rating'] = this.bookingRating;
    data['booking_status'] = this.bookingStatus;
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['user_type'] = this.userType;
    data['fcm_topics'] = this.fcmTopics;
    return data;
  }
}

class BookingPackage {
  int? packageId;
  String? packageName;
  String? packageType;
  String? packagePrice;
  String? packageDuration;
  String? packageStatus;
  String? packageFeaturesName;
  List<PackageBenefits>? packageBenefits;

  BookingPackage(
      {this.packageId,
        this.packageName,
        this.packageType,
        this.packagePrice,
        this.packageDuration,
        this.packageStatus,
        this.packageFeaturesName,
        this.packageBenefits});

  BookingPackage.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packageType = json['package_type'];
    packagePrice = json['package_price'];
    packageDuration = json['package_duration'];
    packageStatus = json['package_status'];
    packageFeaturesName = json['package_features_name'];
    if (json['package_benefits'] != null) {
      packageBenefits = <PackageBenefits>[];
      json['package_benefits'].forEach((v) {
        packageBenefits!.add(new PackageBenefits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['package_type'] = this.packageType;
    data['package_price'] = this.packagePrice;
    data['package_duration'] = this.packageDuration;
    data['package_status'] = this.packageStatus;
    data['package_features_name'] = this.packageFeaturesName;
    if (this.packageBenefits != null) {
      data['package_benefits'] =
          this.packageBenefits!.map((v) => v.toJson()).toList();
    }
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
    data['name'] = this.name;
    data['limit'] = this.limit;
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
    data['shop_id'] = this.shopId;
    data['image'] = this.image;
    data['shop_name'] = this.shopName;
    data['shop_mobile'] = this.shopMobile;
    data['shop_email'] = this.shopEmail;
    data['shop_owner'] = this.shopOwner;
    data['shop_alter_email'] = this.shopAlterEmail;
    data['shop_alter_mobile'] = this.shopAlterMobile;
    data['shop_delivery_type'] = this.shopDeliveryType;
    data['shop_recommend'] = this.shopRecommend;
    data['shop_sportlight'] = this.shopSportlight;
    data['shop_popular'] = this.shopPopular;
    data['shop_featured'] = this.shopFeatured;
    data['shop_description'] = this.shopDescription;
    data['shop_address_line1'] = this.shopAddressLine1;
    data['shop_address_line2'] = this.shopAddressLine2;
    data['shop_location'] = this.shopLocation;
    data['shop_landmark'] = this.shopLandmark;
    data['shop_city'] = this.shopCity;
    data['shop_state'] = this.shopState;
    data['shop_postcode'] = this.shopPostcode;
    data['shop_country'] = this.shopCountry;
    data['shop_lat'] = this.shopLat;
    data['shop_long'] = this.shopLong;
    data['shop_activity_status'] = this.shopActivityStatus;
    data['shop_change_status_time'] = this.shopChangeStatusTime;
    data['shop_status'] = this.shopStatus;
    data['shop_create_at'] = this.shopCreateAt;
    data['shop_details'] = this.shopDetails;
    if (this.shopCategories != null) {
      data['shop_categories'] =
          this.shopCategories!.map((v) => v.toJson()).toList();
    }
    data['shop_account_holder'] = this.shopAccountHolder;
    data['shop_account_number'] = this.shopAccountNumber;
    data['shop_confirm_account_number'] = this.shopConfirmAccountNumber;
    data['shop_bank_name'] = this.shopBankName;
    data['shop_bank_branch_name'] = this.shopBankBranchName;
    data['shop_upi'] = this.shopUpi;
    data['shop_ifsc'] = this.shopIfsc;
    if (this.shopDocuments != null) {
      data['shop_documents'] =
          this.shopDocuments!.map((v) => v.toJson()).toList();
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
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_detail'] = this.categoryDetail;
    data['category_status'] = this.categoryStatus;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class OnGoingBookings {
  int? bookingId;
  BookingUser? bookingUser;
  Null? bookingAddress;
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

  OnGoingBookings(
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

  OnGoingBookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingUser = json['booking_user'] != null
        ? new BookingUser.fromJson(json['booking_user'])
        : null;
    bookingAddress = json['booking_address'];
    bookingPackage = json['booking_package'] != null
        ? new BookingPackage.fromJson(json['booking_package'])
        : null;
    bookingCenter = json['booking_center'] != null
        ? new BookingCenter.fromJson(json['booking_center'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    if (this.bookingUser != null) {
      data['booking_user'] = this.bookingUser!.toJson();
    }
    data['booking_address'] = this.bookingAddress;
    if (this.bookingPackage != null) {
      data['booking_package'] = this.bookingPackage!.toJson();
    }
    if (this.bookingCenter != null) {
      data['booking_center'] = this.bookingCenter!.toJson();
    }
    data['booking_number'] = this.bookingNumber;
    data['booking_date'] = this.bookingDate;
    data['booked_date'] = this.bookedDate;
    data['booked_time'] = this.bookedTime;
    data['booking_veh_name'] = this.bookingVehName;
    data['booking_veh_num'] = this.bookingVehNum;
    data['booking_veh_type'] = this.bookingVehType;
    data['booking_instruct'] = this.bookingInstruct;
    data['booking_accepted_at'] = this.bookingAcceptedAt;
    data['booking_proccessed_at'] = this.bookingProccessedAt;
    data['booking_picked_at'] = this.bookingPickedAt;
    data['booking_completed_at'] = this.bookingCompletedAt;
    data['booking_rejected_at'] = this.bookingRejectedAt;
    data['booking_payment_method'] = this.bookingPaymentMethod;
    data['booking_payment_detail'] = this.bookingPaymentDetail;
    data['booking_payment_status'] = this.bookingPaymentStatus;
    data['booking_review'] = this.bookingReview;
    data['booking_rating'] = this.bookingRating;
    data['booking_status'] = this.bookingStatus;
    return data;
  }
}
