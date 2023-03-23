import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = '/intro_screen';
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('assets/images/$assetName', width: width);
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
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 4000,
      pages: [
        PageViewModel(
          title: "Select your Car",
          body:
              "You can select your or add up to 5 cars yours, family, friends.",
          image: _buildImage('intro_first.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Choose Wash Package",
          body:
              "For each car select one for our package than you can add your add one.",
          image: _buildImage('intro_sec.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Relax & Get Notified",
          body:
              "Relax & Get Notified Book an appointment with doctor.Chat with doctor via appoinment letter &  get consultant.",
          image: _buildImage('int_third.png'),
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
