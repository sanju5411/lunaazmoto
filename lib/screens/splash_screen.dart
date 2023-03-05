import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/intro/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

   static  const String KEYLOGIN = "login";
   static  const String KEYFORMFILLED = "formFilled";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Lottie.asset(
              "assets/lotties/vehicle_ser.json",
              width: 300,
              height: 200,
            ),
          ),
          Positioned(
            bottom: 70,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              width: MediaQuery.of(context).size.width,
              child: const AutoSizeText(
                "BIKE AND CAR REPAIR AND SERVICE",
                style: TextStyle(
                  color: CustomColor.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w800
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);
    var isFormFill = sharedPref.getBool(KEYFORMFILLED);
    Timer(  Duration(seconds: 5), () {
      if(isLoggedIn!=null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => FillformScreen(),),);
        }
        else{
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  LoginScreen(),),);
        }

        if(isFormFill!=null){
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashboardScreen(),),);
        }
      }
      else{
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>  IntroScreen()),);
      }
    }
    );




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
