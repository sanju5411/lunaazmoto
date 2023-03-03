import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
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
  static var  nameValue = "Name";
  static var  emailValue = "Email";
  static var  dobValue = "Date of Birth";

  void refreshData(){
    nameValue.toString();
    emailValue.toString();
    dobValue.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text('5sw5hw4'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(blurRadius: 1),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [

                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),



                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),


                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                  Text(
                    "V 1.0.0.1",
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (route) => false);
                },

              ),
            )
          ],
        ),
      ),
    );
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
