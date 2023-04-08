import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lunaaz_moto/common/builders/custom_page_route.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/login/login.dart';
import 'package:lunaaz_moto/models/auth/login/login_check.dart';
import 'package:lunaaz_moto/screens/auth/otp_screen.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_dashboard/vendor_dashboard_screen.dart';
import 'package:lunaaz_moto/screens/splash_screen.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:lunaaz_moto/services/device_info_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _countryCode = "+91";
  String _mobileNumber = "";
  String _mobileTextError = "";
  String _fcmToken = "";
  bool _isLoading = false;

  List<String> _userTypes = [];
  String userType = "customer";
  bool multiUserType = false;

  TextEditingController phoneController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String verificationIDRecived = "";


  _getFCMToken() async {
    await _firebaseMessaging.getToken().then((value) {
      _fcmToken = value ?? "";
    });
  }



  @override
  void initState() {
    SharedPreferencesService.setFirstFalse();
    _getFCMToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: screenSize.height,
                  width: screenSize.width,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                          child: Image.asset("assets/images/loginback.png"),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 24,
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColor.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 20.0),
                              child: TextField(
                                maxLength: 10,
                                controller: phoneController,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  counterText: "",
                                    hintText: "Enter Mobile Number",
                                    hintStyle:
                                    TextStyle(color: CustomColor.primaryColor),
                                    border: InputBorder.none),
                                onChanged: (phone) {
                                  setState(() {
                                    _isLoading = false;
                                    _mobileTextError = "";
                                  });
                                  if (phone.length > 10) {
                                    setState(() {
                                      _mobileTextError = "Invalid Mobile Number";
                                    });
                                  }
                                  else if(phone.length < 10){
                                    _mobileTextError  = "Enter 10 digit number";
                                  }
                                  if (phone.length == 10) {
                                    setState(() {
                                      _mobileNumber = phone;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.phone,
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: SizedBox(
                            width: screenSize.width,
                            height: 20,
                            child: Text(
                              _mobileTextError,
                              style: CustomStyle.errorTextStyle,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: CustomButton(
                            loading: _isLoading,
                            onTap: () async {
                              // verifyNumber();
                              _loginCheck();
                            },
                            text: "Log In",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child:
                  Image.asset("assets/images/login_bc.png", fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          multiUserType
              ? Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.black87,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 2,
                        spreadRadius: 3,
                      ),
                    ]),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login With",
                      style: CustomStyle.primaryTextStyle,
                    ),
                    const Text(
                      "It's seem that you have multiple accounts with this mobile number",
                      textAlign: TextAlign.center,
                      style: CustomStyle.secondaryTextStyle,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _userTypes.length,
                        itemBuilder: (BuildContext context, index) {
                          return InkWell(
                            onTap: () => setState(() {
                              userType = _userTypes[index];
                            }),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: userType == _userTypes[index]
                                    ? CustomColor.accentColor
                                    .withBlue(200)
                                    .withAlpha(150)
                                    : Colors.white,
                              ),
                              child: Text(
                                _userTypes[index]
                                    .toUpperCase()
                                    .replaceAll("_", " "),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            onTap: () {
                              setState(() {
                                multiUserType = false;
                              });
                              _login();
                            },
                            text: "Login",
                            enabled: userType.isNotEmpty,
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: CustomButton(
                            onTap: () => setState(() {
                              userType = "";
                              multiUserType = false;
                            }),

                            textWidget: Text("Cancel",style: TextStyle(color: CustomColor.primaryColor),),
                            variant: Variant.cancel,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }

  _loginCheck() async {
    if (_isLoading) return;
   // print("_loginCheck() called");
    if (_mobileNumber.isEmpty) {
     // print("_loginCheck() is Empty");
      Fluttertoast.showToast(msg: "Enter mobile number");
      return;
    }

    Map<String, String> jsonInput = {
      'country_code': _countryCode,
      'mobile': _mobileNumber
    };

    setState(() {
      _isLoading = true;
    });
    LoginCheck loginCheck = await ApiService.loginCheck(jsonInput: jsonEncode(jsonInput));
   // print("login check api>>>>>${jsonEncode(loginCheck)}");
    if (loginCheck.status == "not-registered") {
      SharedPreferencesService.setRegistered(registered: false);

      sendOtp();
      return;
    }
    if (loginCheck.status == "success") {

      if (loginCheck.userTypes != null && loginCheck.userTypes!.isNotEmpty)   {
        if (loginCheck.userTypes!.length > 1) {
          setState(() {
            _userTypes = loginCheck.userTypes ?? [];
            multiUserType = true;
            _isLoading = false;
          });
          return;
        } else {
          setState(() {
            userType = loginCheck.userTypes != null
                ? loginCheck.userTypes![0]
                : "customer";
            multiUserType = false;
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          userType = "customer";
          multiUserType = false;
          _isLoading = true;
        });
      }
    } else {
      setState(() {
        multiUserType = false;
        userType = "customer";
        _isLoading = true;
      });
    }
    _login();
  }

  sendOtp () {
    Map<String, String> data = {
      'country_code': _countryCode,
      'mobile': _mobileNumber,
      'user_type': userType,
      'fcm_token': _fcmToken,
    };
    Navigator.pushNamed(context, OtpScreen.routeName, arguments: data).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  _login() async {
    if (_mobileNumber.isEmpty) {
      Fluttertoast.showToast(msg: "Enter mobile number");
      return;

    }

    Map<String, String> jsonInput = {
      'country_code': _countryCode,
      'mobile': _mobileNumber ,
      'device_id': DeviceInfoService.deviceId ?? "",
      'device_type': DeviceInfoService.deviceType ?? "",
      'fcm_token': _fcmToken,
      'user_type': userType,
    };

   // print("jsonEncode(jsonInput)${jsonEncode(jsonInput)}");
    // print("map fcm token>>>>>>>(jsonInput)${jsonEncode(jsonInput)}>>>>>>>");
    setState(() {
      _isLoading = true;
    });

    Login login = await ApiService.login(jsonInput: jsonEncode(jsonInput));

    print('LOGIN_RES ${jsonEncode(login)}');

    if (login.status == "success") {


      if (login.token != null) {
        await SharedPreferencesService.setApiToken(apiToken: login.token!);
      }
      if (login.user != null) {
        await SharedPreferencesService.setAuthUser(authUser: login.user!);

      }
      if (!mounted) return;
      String routeName = DashboardScreen.routeName;
      SharedPreferencesService.setLoggedIn(loggedIn: true);
      SharedPreferencesService.setRegistered(registered: true);
      if (login.user!.userType == "customer") {
        routeName = DashboardScreen.routeName;


      }
      if (login.user!.userType == "service_center") {
        routeName = ServiceDashboard.routeName;
      }
      if (login.user!.userType == "driver") {
        routeName = DeliveryDashboard.routeName;
      }
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
    } else if (login.status == "warning") {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
         SharedPreferencesService.setRegistered(registered: false);

        sendOtp();
      }
      return;
    }
    else if (login.status == 'unauthorize') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Access Denied",
            style: CustomStyle.primaryTextStyle.copyWith(fontSize: 24),
          ),
          // icon: const Icon(
          //   Icons.warning_amber_rounded,
          //   color: CustomColor.primaryColor,
          //   size: 60,
          // ),
          content: Text(
            login.message ?? "",
            style: CustomStyle.secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    else if(login.status == 'device-not-register') {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        SharedPreferencesService.setRegistered(registered: true);
        sendOtp();
      }
      return;
    }
    else {
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }
}