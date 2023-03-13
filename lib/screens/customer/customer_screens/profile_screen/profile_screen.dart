import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/models/profile/profile_model.dart';
import 'package:lunaaz_moto/models/profile/user_data.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile_screen';
  final bool leadingSpace;
  final IconData? leadingIcon;
  final Widget? leading;
  final String? titleText;
  final Widget? title;
  final IconData? trailingIcon;
  final Widget? trailing;
  final void Function()? onTap;

  const ProfileScreen({Key? key,
    this.leadingSpace = true,
    this.leadingIcon,
    this.leading,
    this.titleText,
    this.title,
    this.trailingIcon,
    this.trailing,
    this.onTap,

  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}


class ProfileScreenState extends State<ProfileScreen> {
  UserData? _userData;
  AuthUser? _authUser;

  // void refreshData(){
  //   nameValue.toString();
  //   emailValue.toString();
  //   dobValue.toString();
  // }

  @override
  void initState() {
    getProfileData();
    super.initState();
    //refreshData();
  }

  getProfileData() async {
    AuthUser authUser = await SharedPreferencesService.getAuthUserData();
    setState(() {
      _authUser = authUser;
    });
    ProfileModel profile = await ApiService.profile();
    if (profile.status != null && profile.status == "success") {
      if (profile.user != null) {
        setState(() {
          _userData = profile.user!;
          print("profile data>>>>>>>${jsonEncode(_authUser)}");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        leading: Container(),
        leadingWidth: 0,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 23,),
              InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, FillformScreen.routeName,
                      arguments: _userData)
                      .then((value) => getProfileData()),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(250, 244, 225, 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 1)
                      ]),
                  child:
                  _authUser != null ?
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(50)),
                        child: (_authUser != null &&
                            _authUser!.avatar != null &&
                            _authUser!.avatar!.isNotEmpty)
                            ? Image.network(
                          '${ApiConfig.baseUrl}${_authUser!.avatar}',
                          fit: BoxFit.cover,
                        )
                            : Icon(Icons.person)
                    ),
                  ) : Icon(Icons.edit),

                ),
              ),
              SizedBox(height: 20,),

         //  _authUser != null ?
              Row(
                children: [
                  Icon(Icons.person,color: CustomColor.primaryColor,),
                  SizedBox(width: 20,),
                  Text(
                    _authUser!.name ?? "",
                    style: CustomStyle.primaryTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.phone,color: CustomColor.primaryColor,),
                  SizedBox(width: 20,),
                  Text(
                    _authUser!.mobile ?? "",
                    style: CustomStyle.primaryTextStyle,
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Image.asset("assets/images/my_servicess.png"),
                  SizedBox(width: 20,),
                  Text("My Services",style: CustomStyle.primaryTextStyle,),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
              ),
              SizedBox(height: 20,),

              CustomButton(
                  onTap: (){
                  _logiout();
                  },
                text: "Log Out",

              ),

            ],
          ),
        ),
      ),
    );
  }

  void _logiout() {
  SharedPreferencesService.setLoggedIn(loggedIn: false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName, (route) => false);

  }




// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//   ),
//   backgroundColor: CustomColor.primaryColor,
//   body: Container(width: screenSize.width,
//     decoration: const BoxDecoration(
//       color: CustomColor.whiteColor,),
//     child: Column(
//       children: [
//         const SizedBox(height: 20,),
//         Text(nameValue,style: TextStyle(fontSize: 30),),
//         const SizedBox(height: 20),
//         Text(emailValue,style:TextStyle(fontSize: 30),),
//         SizedBox(height: 20,),
//         Text(dobValue,style:TextStyle(fontSize: 30),),
//       ],
//     )
//   ),
// );
  // void getValue() async{
  //   var pref = await SharedPreferences.getInstance();
  //     nameValue = pref.getString('name')??'';
  //
  // }


}


class ProfileOptionContainer extends StatelessWidget {
  final bool leadingSpace;
  final IconData? leadingIcon;
  final Widget? leading;
  final String? titleText;
  final Widget? title;
  final IconData? trailingIcon;
  final Widget? trailing;
  final void Function()? onTap;
  const ProfileOptionContainer({
    Key? key,
    this.leadingSpace = true,
    this.leadingIcon,
    this.leading,
    this.titleText,
    this.title,
    this.trailingIcon,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            leadingSpace
                ? SizedBox(
              width: 40,
              child: leading ??
                  (leadingIcon != null
                      ? Icon(
                    leadingIcon,
                    color: CustomColor.primaryColor,
                    size: 20,
                  )
                      : Container()),
            )
                : Container(),
            const SizedBox(width: 10),
            Expanded(
              child:
              title ?? (titleText != null ? Text(titleText!) : Container()),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 40,
              child: trailing ??
                  (trailingIcon != null
                      ? Icon(
                    trailingIcon,
                    color: CustomColor.primaryColor,
                    size: 22,
                  )
                      : Container()),
            ),
          ],
        ),
      ),
    );
  }
}

