import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro_screen';
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Lottie.asset('assets/lotties/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: CustomColor.backgroundColor,
      allowImplicitScrolling: true,
      //autoScrollDuration: 4000,
      pages: [
        PageViewModel(
          title: "Delivery Facility",
          body:
              "You can select your Package",
          image: _buildImage('intro1_anim.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Best Team",
          body:
              "We have best Emplyoes",
          image: _buildImage('intro2_anim.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Relax & Get Notified",
          body:
              "Relax & Get Notified Book an appointment with doctor.Chat with doctor via appoinment letter &  get consultant.",
          image: _buildImage('intro3_anim.json'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_back_outlined,
            color: CustomColor.primaryColor,
            size: 30,
          )),
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: CustomColor.primaryColor,
        ),
      ),
      next: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward,
            color: CustomColor.primaryColor,
            size: 30,
          )),
      done: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Done",
            style: TextStyle(fontSize: 20, color: CustomColor.primaryColor),
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xffffd2d2),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xff820000),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
