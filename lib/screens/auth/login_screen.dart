import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:lunaaz_moto/screens/service_centre/screens/dashboard_screen.dart';
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
  String userType = "";
  bool multiUserType = false;

  TextEditingController phoneController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationIDRecived = "";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.backgroundLightColor,
      body: SingleChildScrollView(
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
                      "Welcome to LunaazMoto",
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
                            // maxLength: 10,
                            controller: phoneController,
                            decoration: const InputDecoration(
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
                              if (phone.length == 10) {
                                setState(() {
                                  _mobileNumber = phone;
                                });
                              }
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          //IntlPhoneField(
                          //   showDropdownIcon: false,
                          //   style: TextStyle(fontSize: 16),
                          //   controller: phoneController,
                          //   decoration: InputDecoration(
                          //     hintText: "Phone Number",
                          //       counterText: "",
                          //     border: InputBorder.none
                          //   ),
                          //   initialCountryCode: 'IN',
                          //   onChanged: (phone) {
                          //     print(phone.completeNumber);
                          //   },
                          //   // onCountryChanged: (country) {
                          //   //   setState(() {
                          //   //     _countryCode = country.completeNumber;
                          //   //   });
                          //   // },
                          // )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                        loading: _isLoading,
                        onTap: () async {
                         // verifyNumber();
                          _loginCheck();
                        },
                        text: "Get Verification Code",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const [
                    //     Text(
                    //       "Don’t  have an account?",
                    //       style: TextStyle(fontSize: 17),
                    //     ),
                    //     SizedBox(
                    //       width: 3,
                    //     ),
                    //     Text(
                    //       "Register",
                    //       style: TextStyle(
                    //           color: CustomColor.primaryColor,
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 17),
                    //     )
                    //   ],
                    // ),
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
    );
  }

  _loginCheck() async {
    if (_isLoading) return;
    print("_loginCheck() called");
    if (_mobileNumber.isEmpty) {
      print("_loginCheck() is Empty");
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
    print("loginCheck called");
    LoginCheck loginCheck =
        await ApiService.loginCheck(jsonInput: jsonEncode(jsonInput));

    print("LOGIN_CHECK>>, ${jsonEncode(loginCheck)}");
    if (loginCheck.status == "success") {
      if (loginCheck.userTypes != null && loginCheck.userTypes!.isNotEmpty) {
        if (loginCheck.userTypes!.length > 1) {
          setState(
            () {
              _userTypes = loginCheck.userTypes ?? [];
              multiUserType = true;
              _isLoading = false;
            },
          );
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

  _login() async {
    if (_mobileNumber.isEmpty) {
      Fluttertoast.showToast(msg: "Enter mobile number");
      return;
    }

    Map<String, String> jsonInput = {
      'country_code': _countryCode,
      'mobile': _mobileNumber,
      'device_id': DeviceInfoService.deviceId ?? "viju",
      'device_type': DeviceInfoService.deviceType ?? "android",
      'fcm_token': _fcmToken,
      'user_type': userType,
    };

    setState(() {
      _isLoading = true;
    });
    Login login = await ApiService.login(jsonInput: jsonEncode(jsonInput));

    print('LOGIN_RES >>>>${jsonEncode(login)}');

    if (login.status == "success") {
      if (login.token != null) {
        await SharedPreferencesService.setApiToken(apiToken: login.token!);
      }
      if (login.user != null) {
        await SharedPreferencesService.setAuthUser(authUser: login.user!);
      }
      print("USERTYPE++++>${login.user!.userType}");
      if (!mounted) return;
      String routeName = DashboardScreen.routeName;

      if (login.user!.userType == "customer") {
        routeName = DashboardScreen.routeName;
        print('route name c = ${routeName}');
      }
      if (login.user!.userType == "service_center") {
        routeName = ServiceDashboard.routeName;
        print('route name s = ${routeName}');
      }
      if (login.user!.userType == "driver") {
        routeName = DeliveryDashboard.routeName;
        print('route name d = ${routeName}');

      }
      print("routeName==>>>>>>${routeName}");
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
    } else if (login.status == "warning") {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        verifyNumber();
      }
      return;
    } else if (login.status == 'unauthorize') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Access Denied",
            style: CustomStyle.primaryTextStyle.copyWith(fontSize: 24),
          ),
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: CustomColor.primaryColor,
            size: 60,
          ),
          content: Text(
            login.message ?? "",
            style: CustomStyle.secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: _countryCode + phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) =>
              {print("You are logged in successfully>>>>>>${value}")});
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDRecived = verificationID;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                mobile: phoneController.toString(),
                verificationId: verificationIDRecived,
                resendToken: resendToken,
                countryCode: _countryCode.toString(),
                userType: userType,
                otpCode: '',
              ),
            ),
          );
          // Navigator.pushNamed(context, OtpScreen.routeName,
          //     arguments: {"mobile": _mobileNumber,"verificationId": verificationIDRecived, });

          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }
}
