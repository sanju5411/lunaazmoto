import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/register/register.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/service_dashboard.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:lunaaz_moto/services/device_info_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp_screen';

  final String mobile, verificationId, countryCode;
  final int? resendToken;
  final String userType;
  final String otpCode;

  const OtpScreen(
      {Key? key,
      required,
      required this.mobile,
      required this.verificationId,
      required this.otpCode,
      required this.resendToken,
      required this.countryCode,
      required this.userType})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool loading = true;
  int initialTimer = 40;
  String otpCode = "";
  bool _isLoading = false;
  Timer? resentTimer;
  int resetTimerSeconds = 50;

  String smsCode = "";

  TextEditingController _pinEditingController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationIDReceived = "";
  //dynamic argument = "";

  @override
  void initState() {
    setState(() {
      verificationIDReceived = widget.verificationId;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      child: Image.asset("assets/images/loginback.png"),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      onTap: () {
                        // resend otp function
                      },
                      child: const Text(
                        "VERIFY OTP",
                        style: TextStyle(
                            fontSize: 24,
                            color: CustomColor.primaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: PinInputTextField(
                        pinLength: 6,
                        decoration: BoxLooseDecoration(
                          strokeColorBuilder: PinListenColorBuilder(
                              CustomColor.primaryColor,
                              CustomColor.primaryColor),
                        ),
                        controller: _pinEditingController,
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.characters,
                        onSubmit: (pin) {},
                        onChanged: (pin) {
                          setState(() {
                            _isLoading = false;
                            smsCode = pin;
                          });
                        },
                        enableInteractiveSelection: false,
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Don’t recieve the otp?",
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "RESEND OTP",
                          style: TextStyle(
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CustomButton(
                        loading: _isLoading,
                        onTap: () => verifyCode(),
                        text: "VERIFY",
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
            )
          ],
        ),
      ),
    );
  }

  void verifyCode() async {
    _isLoading = true;
    FirebaseAuth auth = FirebaseAuth.instance;
    print("auth=>${widget.verificationId}");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _pinEditingController.text);
    try {
      await auth.signInWithCredential(credential);
      print("register function calledddddd>>>>>>>>>>>>>>>>>>>");
      _register();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(msg: "Enter valid otp");
    }
    await auth.signInWithCredential(credential).then((value) {
      print("Your are Logged in Successfully>>>");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FillformScreen(),
        ),
      );
    });
  }

  _register() async {
    Map<String, String> jsonInput = {
      'country_code': widget.countryCode,
      'mobile': widget.mobile,
      'device_id': DeviceInfoService.deviceId ?? "35868e",
      'device_type': DeviceInfoService.deviceType ?? "android",
      'user_type': widget.userType,
    };

    Register register =
        await ApiService.register(jsonInput: jsonEncode(jsonInput));

    if (register.status == "success") {
      if (register.token != null) {
        await SharedPreferencesService.setApiToken(apiToken: register.token!);
      }
      if (register.user != null) {
        await SharedPreferencesService.setAuthUser(authUser: register.user!);
      }

      if (!mounted) return;

      String routeName = DashboardScreen.routeName;
      if (widget.userType == "customer") {
        routeName = DashboardScreen.routeName;
      } else if (widget.userType == "service_center") {
        routeName = ServiceDashboard.routeName;
      } else if (widget.userType == "driver") {
        routeName = DeliveryDashboard.routeName;
      }
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(msg: register.message ?? "Something went wrong");
    }

    setState(() {
      _isLoading = false;
    });
  }
}
