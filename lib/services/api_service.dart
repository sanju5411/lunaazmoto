import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/models/auth/login/login.dart';
import 'package:lunaaz_moto/models/auth/login/login_check.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_main_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';
import 'package:lunaaz_moto/models/profile/profile_model.dart';
import 'package:lunaaz_moto/models/register/register.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:path/path.dart';
import 'package:profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print('Object >>>>>${json}');
      return Login.fromJson(json);
    } catch (e) {
      debugPrint("LOGIN_API_ERROR>>> $e");
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


  static Future<PackagesMainModel> packages() async {
    Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.packages}');
    String token = await SharedPreferencesService.getApiToken();
    headers.addAll({'Authorization': 'Bearer $token'});

    try {
      var res = await post(
        uri,
        headers: headers,
      );
      var json = jsonDecode(res.body);
      return PackagesMainModel.fromJson(json);
    } catch (e) {
      print("PACKAGES_API_ERROR>>> $e");
      return PackagesMainModel();
    }
  }





}
