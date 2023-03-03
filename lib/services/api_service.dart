import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/models/auth/login/login.dart';
import 'package:lunaaz_moto/models/auth/login/login_check.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
import 'package:lunaaz_moto/models/register/register.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
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
      var res = await post(
        uri,
        headers: headers,
        body: jsonInput,
      );
      var json = jsonDecode(res.body);
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
    Uri uri = Uri.parse('${ApiConfig.apiV1}/');
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



  // static Future<Register> register({required Object jsonInput}) async {
  //   Uri uri = Uri.parse('${ApiConfig.apiV1}/${ApiConfig.registration}');
  //   try {
  //     var res = await post(
  //       uri,
  //       headers: headers,
  //       body: jsonInput,
  //     );
  //     var json = jsonDecode(res.body);
  //     return Register.fromJson(json);
  //   } catch (e) {
  //     debugPrint("REGISTER_API_ERROR>>> $e");
  //     return Register();
  //   }
  // }
  //
  // static Future<Dashboard> dashboard() async {
  //   String lang = await SharedPreferencesService.getActiveLanguage();
  //   Uri uri = Uri.parse(
  //       '${lang == 'en' ? ApiConfig.apiEn : ApiConfig.apiHi}${ApiConfig.dashboard}');
  //   String token = await SharedPreferencesService.getApiToken();
  //   headers.addAll({'Authorization': 'Bearer $token'});
  //
  //   try {
  //     var res = await get(
  //       uri,
  //       headers: headers,
  //     );
  //     var json = jsonDecode(res.body);
  //     return Dashboard.fromJson(json);
  //   } catch (e) {
  //     print("DASHBOARD_API_ERROR>>> $e");
  //     return Dashboard();
  //   }
  // }
  //
  // static Future<ApiResponse> updateFCMToken({required Object jsonInput}) async {
  //   String lang = await SharedPreferencesService.getActiveLanguage();
  //   String? token = await SharedPreferencesService.getApiToken();
  //   headers.addAll({'Authorization': 'Bearer $token'});
  //   Uri uri = Uri.parse(
  //       '${lang == 'en' ? ApiConfig.apiEn : ApiConfig.apiHi}${ApiConfig.updateFCMToken}');
  //   try {
  //     var res = await post(
  //       uri,
  //       headers: headers,
  //       body: jsonInput,
  //     );
  //     var json = jsonDecode(res.body);
  //     return ApiResponse.fromJson(json);
  //   } catch (e) {
  //     print("updateFCMToken API ERROR>>> $e");
  //     return ApiResponse();
  //   }
  // }
  //
}
