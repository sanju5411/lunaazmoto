import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/models/auth/login/login.dart';
import 'package:lunaaz_moto/models/auth/login/login_check.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/models/choose_vehicle_model/choose_vehicle_model.dart';
import 'package:lunaaz_moto/models/customer/booking_model/booking_model.dart';
import 'package:lunaaz_moto/models/customer/dashboard/dashboard.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_main_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';
import 'package:lunaaz_moto/models/customer/user_address_model/user_address_model.dart';
import 'package:lunaaz_moto/models/drivers/booking_list_main_model.dart';
import 'package:lunaaz_moto/models/profile/profile_model.dart';
import 'package:lunaaz_moto/models/register/register.dart';
import 'package:lunaaz_moto/models/service_center/booking_details_main_model.dart';
import 'package:lunaaz_moto/models/service_center/service_center_list_main_model.dart';
import 'package:lunaaz_moto/models/user_addressModel/user_address_model.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:path/path.dart';
import 'package:profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Notification/NotificationMainModel.dart';
import '../models/drivers/drivers_main_model.dart';
import '../models/serviceModule/dashboard/ServiceCentersMainModel.dart';

Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};


class ApiService {
  static Future<LoginCheck> loginCheck({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.loginCheck}');
    try {
      var res = await post(uri,headers: headers,body: jsonInput,);
      var json = jsonDecode(res.body);
      return LoginCheck.fromJson(json);
    } catch (e) {
      debugPrint("LOGIN_CHECK_API_ERROR>>> $e");
      return LoginCheck();
    }
  }

  static Future<Login> login({required Object jsonInput}) async {

    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.login}');
    try {
      var res = await post(uri,headers: headers,body: jsonInput,);
      var json = jsonDecode(res.body);
      print('Object >>>>>${jsonInput}');
      return Login.fromJson(json);
    } catch (e) {
      debugPrint("LOGIN_API_ERROR>>> $e");
      Fluttertoast.showToast(msg: "Network Connection Problem");
      return Login();
    }
  }

  static Future<Login> resendOtp({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.resendOtp}');
    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );
      var json = jsonDecode(res.body);
      return Login.fromJson(json);
    } catch (e) {
      debugPrint("OTP RESEND API_ERROR>>> $e");
      return Login();
    }
  }

    static Future<Login> updateProfile({required String name, String? email, File? avatar,String? mobile}) async {
    Uri uri = Uri.parse("${ApiConfig.apiV1}/${ApiConfig.updateProfile}");
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});
    var request = MultipartRequest("POST", uri);

    request.headers.addAll(headers);
    request.fields['name'] = name;
    if(mobile != null) request.fields['mobile'] = mobile;
    if (email != null) {
      request.fields['email'] = email;
    }

    if (avatar != null) {
      var bytes = avatar.readAsBytesSync();
      var stream = ByteStream.fromBytes(bytes);
      var length = await avatar.length();
      var multipartFile = MultipartFile("avatar", stream, length,
      filename: basename(avatar.path));

      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var json = jsonDecode(responseString);
      return Login.fromJson(json);
    } catch (e) {
      print(e.toString());
      return Login();
    }
  }

  static Future<ProfileModel> profile() async {
 //.   String lang = await SharedPreferencesService.getActiveLanguage();
    Uri uri = Uri.parse(
        '${ApiConfig.apiV1}/${ApiConfig.profile}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return ProfileModel.fromJson(json);
    } catch (e) {
      print("PROFILE_API_ERROR>>> $e");
      return ProfileModel();
    }
  }

  static Future<Register> register({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.registration}');
    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );
      var json = jsonDecode(res.body);
      return Register.fromJson(json);
    } catch (e) {
      debugPrint("REGISTER_API_ERROR>>> $e");
      return Register();
    }
  }

  static Future<Dashboard> dashboard(userType) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${userType}/${ApiConfig.dashboard}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    print("token--->$token");

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return Dashboard.fromJson(json);
    } catch (e) {
      print("DASHBOARD_API_ERROR>>> $e");
      return Dashboard();
    }
  }

  static Future<PackagesMainModel> packages({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.packages}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );

      var json = jsonDecode(res.body);
      return PackagesMainModel.fromJson(json);
    } catch (e) {
      print("PACKAGES_API_ERROR>>> $e");
      return PackagesMainModel();
    }
  }


  static Future<DriverMainModel> getDriverDashboardData() async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.driversDashboard}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    print("Dashboard token--->$token");

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return DriverMainModel.fromJson(json);
    } catch (e) {
      print("DASHBOARD_API_ERROR>>> $e");
      return DriverMainModel();
    }
  }

  static Future<BookingModel> setBookingForm({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.saveBookingForm}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );
      var json = jsonDecode(res.body);
      return BookingModel.fromJson(json);
    } catch (e) {
      print("Booking_FORM_ERROR>>> $e");
      return BookingModel();
    }
  }

  static Future<BookingList> getMyServices() async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookinglist}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return BookingList.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingList();
    }
  }

  static Future<BookingList> changeServiceStatus({required var bookingId, required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingChangeStatus}/$bookingId');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
        uri,
        headers: headers,
        body : jsonInput
      );
      print("BOOKING_LIST_ERROR>>> $uri");
      print("BOOKING_LIST_ERROR>>> $jsonInput");
      var json = jsonDecode(res.body);
      return BookingList.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingList();
    }
  }

  static Future<BookingList> changeServiceStatusServiceCenter({required var bookingId, required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingChangeStatusServiceCenter}/$bookingId');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
          uri,
          headers: headers,
          body : jsonInput
      );
      print("BOOKING_LIST_ERROR>>> $uri");
      print("BOOKING_LIST_ERROR>>> $jsonInput");
      var json = jsonDecode(res.body);
      return BookingList.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingList();
    }
  }

  static Future<BookingListMainModel> getBookingListWithKey({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingListWithKeyDriver}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
          uri,
          headers: headers,
          body : jsonInput
      );

      var json = jsonDecode(res.body);
      return BookingListMainModel.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingListMainModel();
    }
  }

  static Future<BookingListMainModel> getBookingListWithKeyServiceCenter({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingListWithKeyServiceCenter}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
          uri,
          headers: headers,
          body : jsonInput
      );

      var json = jsonDecode(res.body);
      return BookingListMainModel.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingListMainModel();
    }
  }

  static Future<ServiceCenterListMainModel> getServiceCenter() async{
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.serviceCenterList}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return ServiceCenterListMainModel.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return ServiceCenterListMainModel();
    }
  }

  static Future<ServiceCenterListMainModel> assingServiceCenter({required var bookingId, required Object jsonInput}) async{
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.assingCenter}/$bookingId');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    print("assign service center--->$uri");

    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput
      );
      var json = jsonDecode(res.body);
      return ServiceCenterListMainModel.fromJson(json);
    } catch (e) {
      print("ASSIGN SERVICE CENTER ERROR>>> $e");
      return ServiceCenterListMainModel();
    }
  }

  static Future<BookingDetailsMainModel> getBookingDetails({required var bookingId}) async{
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingDetails}/$bookingId');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
          uri,
          headers: headers,
      );
      var json = jsonDecode(res.body);
      return BookingDetailsMainModel.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingDetailsMainModel();
    }

  }

  static Future<BookingDetailsMainModel> getBookingDetailsServiceCenter({required var bookingId}) async{
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.bookingDetailsSC}/$bookingId');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return BookingDetailsMainModel.fromJson(json);
    } catch (e) {
      print("BOOKING_LIST_ERROR>>> $e");
      return BookingDetailsMainModel();
    }

  }

  static Future<AuthAddress> getAddressListD() async{
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.getAddress}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return AuthAddress.fromJson(json);
    } catch (e) {
      print("ADDRESS_LIST_ERROR>>> $e");
      return AuthAddress();
    }
  }

  static Future<AuthAddress> setAddressForm({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.saveAddress}');

    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );
      print(jsonInput);
      var json = jsonDecode(res.body);
      return AuthAddress.fromJson(json);
    } catch (e) {
      print("SET_ADDRESS_ERROR>>> $e");
      return AuthAddress();
    }
  }

  static Future<ServiceCentersMainModel> getServiceCenterDashboardData() async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.serviceCenterDashboard}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    print("Dashboard token--->$token");

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return ServiceCentersMainModel.fromJson(json);
    } catch (e) {
      print("DASHBOARD_API_ERROR>>> $e");
      return ServiceCentersMainModel();
    }
  }

  static Future<ChooseVehModel> setChooseVeh({required Object jsonInput}) async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.chooseVeh}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
          uri,
          headers: headers,
          body : jsonInput
      );

      var json = jsonDecode(res.body);
      return ChooseVehModel.fromJson(json);
    } catch (e) {
      print("CHOOSE_VEH_ERROR>>> $e");
      return ChooseVehModel();
    }
  }

  static Future<NotificationMainModel> getNotificationData() async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.notifications}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    print("Dashboard token--->$token");

    try {
      var res = await get(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return NotificationMainModel.fromJson(json);
    } catch (e) {
      print("Notification>>> $e");
      return NotificationMainModel();
    }
  }






}
