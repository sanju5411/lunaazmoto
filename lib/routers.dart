import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/builders/custom_page_route.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/auth/otp_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/intro/intro_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final arguments = routeSettings.arguments;
  switch (routeSettings.name) {
    case IntroScreen.routeName:
      return CustomPageRoute(
        child:  IntroScreen(),
        routeSettings: routeSettings,
      );


    case LoginScreen.routeName:
      return CustomPageRoute(
        child:  const LoginScreen(),
        routeSettings: routeSettings,
      );


    case OtpScreen.routeName:
      return CustomPageRoute(
        child:   OtpScreen(mobile: '', verificationId: '', countryCode: '', resendToken: null, userType: '', otpCode: '',),
        routeSettings: routeSettings,
      );



    case DashboardScreen.routeName:
      return CustomPageRoute(
        child:  const DashboardScreen(),
        routeSettings: routeSettings,
      );




    case ProfileScreen.routeName:
      return CustomPageRoute(
        child:  const ProfileScreen(),
        routeSettings: routeSettings,
      );

    case FillformScreen.routeName:
      return CustomPageRoute(
        child:  const FillformScreen(),
        routeSettings: routeSettings,
      );


    default:
      return CustomPageRoute(
          child: const Scaffold(
            body: Center(
              child: Text('Screen does not exists '),
            ),
          ));
  }
}
