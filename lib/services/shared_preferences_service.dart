import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lunaaz_moto/configs/shared_preference/shared_preference_key.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> setFirstFalse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.isFirst, false);
  }

  static Future<bool> isFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferencesKey.isFirst) ?? true;
  }

  static Future<void> setLoggedIn({required bool loggedIn}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.isLoggedIn, loggedIn);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferencesKey.isLoggedIn) ?? false;
  }


  static Future<void> setRegistered({required bool registered}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.isRegistered, registered);
  }

  static Future<bool> isRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPreferencesKey.isRegistered) ?? false;
  }

  static Future<void> setApiToken({required String apiToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesKey.apiToken, apiToken);
  }
  static Future<String> getApiToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferencesKey.apiToken) ?? "";
  }
  static Future<void> setFcmTopics({required List<String> fcmTopics}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> oldTopics =
        prefs.getStringList(SharedPreferencesKey.fcmTopics) ?? [];
    if (oldTopics.isNotEmpty) {
      for (String topic in oldTopics) {
        await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      }
    }
    await prefs.setStringList(SharedPreferencesKey.fcmTopics, fcmTopics);
    for (String topic in fcmTopics) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    }
  }



  static Future<AuthUser> getAuthUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthUser authUser = AuthUser(
      id: prefs.getInt(SharedPreferencesKey.authUserId),
      name: prefs.getString(SharedPreferencesKey.authUserName),
      mobile: prefs.getString(SharedPreferencesKey.authUserMobile),
      email: prefs.getString(SharedPreferencesKey.authUserEmail),
      avatar: prefs.getString(SharedPreferencesKey.authUserAvatar),
      userType: '${prefs.getString(SharedPreferencesKey.authUserType)}',
    );
    return authUser;
  }


  static Future<void> setAuthUser({required AuthUser authUser}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(SharedPreferencesKey.authUserId, authUser.id ?? 0);
    await prefs.setString(
        SharedPreferencesKey.authUserName, authUser.name ?? "");
    await prefs.setString(
        SharedPreferencesKey.authUserEmail, authUser.email ?? "");
    await prefs.setString(
        SharedPreferencesKey.authUserMobile, authUser.mobile ?? "");
    await prefs.setString(
        SharedPreferencesKey.authUserAvatar, authUser.avatar ?? "");
    await prefs.setString(
        SharedPreferencesKey.authUserDateOfBirth, authUser.dateOfBirth ?? "");
    await prefs.setString(SharedPreferencesKey.authUserType,
        authUser.userType != null ? authUser.userType.toString() : "");
    if (authUser.fcmTopics != null && authUser.fcmTopics!.isNotEmpty) {
      setFcmTopics(fcmTopics: authUser.fcmTopics!);
    }
  }


}
