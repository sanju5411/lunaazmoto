import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/intro/intro_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_dashboard/vendor_dashboard_screen.dart';
import 'package:lunaaz_moto/services/device_info_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  static const String KEYFORMFILLED = "formFilled";
  final DeviceInfoService deviceInfoService = DeviceInfoService();
  final Duration _splashTimer = const Duration(seconds: 3);
  Timer? timer;

  @override
  void initState() {
    deviceInfo();
    getStarted();
    super.initState();
  }

  deviceInfo() async {
    await deviceInfoService.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Image.asset(
                "assets/icon/lunaazmoto_logo.gif",
                repeat: ImageRepeat.noRepeat,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getStarted() async {
    String routeName = IntroScreen.routeName;
    if (!await SharedPreferencesService.isFirst()) {
      if (await SharedPreferencesService.isLoggedIn()) {
        if (await SharedPreferencesService.isRegistered()) {
          var user = await SharedPreferencesService.getAuthUserData();

          if (user.userType == "customer") {
            routeName = DashboardScreen.routeName;
          } else if (user.userType == "service_center") {
            routeName = ServiceDashboard.routeName;
          } else if (user.userType == "driver") {
            routeName = DeliveryDashboard.routeName;
          }
        } else {
          routeName = FillformScreen.routeName;
        }
      } else {
        routeName = LoginScreen.routeName;
      }
    }
    timer = Timer.periodic(_splashTimer, (timer) {
      Navigator.pushReplacementNamed(context, routeName);
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}

// if(isLoggedIn!=null){
// if(isLoggedIn){
//
// Navigator.pushReplacement(context,
// MaterialPageRoute(builder:
// (context) => IntroScreen()),);
// } else{
// Navigator.pushReplacement(context,
// MaterialPageRoute(builder:
// (context) => LoginScreen()
// )
// );
// }
// }
// else{
// Navigator.pushReplacement(context,
// MaterialPageRoute(builder:
// (context) => LoginScreen()
// )
// );
// }
