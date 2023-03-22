import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/login/login.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/models/profile/user_data.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/splash_screen.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillformScreen extends StatefulWidget {
  static const String routeName = '/fill_out_form';

  const FillformScreen({Key? key}) : super(key: key);

  @override
  State<FillformScreen> createState() => FillformScreenState();
}

class FillformScreenState extends State<FillformScreen> {

  String? path;
  AuthUser? _userData;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();

  }

  getProfileData() async{

   var userData =  await SharedPreferencesService.getAuthUserData();
    setState(() {
      _userData = userData;
      _nameController.text = _userData != null ? _userData!.name ?? "" : "";
      _emailController.text = _userData != null ? _userData!.email ?? "" : "";
      _mobileController.text = _userData != null ? _userData!.mobile ?? "" : "";
      print("${jsonEncode(_userData)}");
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE8DA),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Fill out of this form",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Please complete your information",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  border: Border.all(
                    color: const Color(0xFFFF8D93),
                    width: 3.0,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    print("ok");
                    _showSelectionDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor:
                    const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipOval(
                        child: path != null
                            ? Image.file(
                          File(path!),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                            : (_userData != null &&
                            _userData!.avatar != null )
                            ? Image.network(
                          '${ApiConfig.baseUrl}${_userData!.avatar}',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        )
                            :Icon(Icons.person)
                      ),
                    ),
                  ),
                ),
              ), //DP>>>>
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  labelText: 'Enter your name',
                  hintText: "Name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  labelText: 'Enter your email',
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _mobileController,
                readOnly: true,
                enabled: false,
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:  BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, color: Colors.black), //<-- SEE HERE
                  ),
                  labelText: 'Enter Mobile Number',
                  hintText: "Mobile",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                loading: _loading,
                onTap: () {
                  bool saveData = true;

                  if(_nameController.text.isEmpty){
                    saveData = false;
                    Fluttertoast.showToast(msg: "Please Enter Name");
                    return;
                  }
                  if(_emailController.text.isEmpty){
                    saveData = false;
                    Fluttertoast.showToast(msg: "Please Enter Email");
                    return;
                  }
                  if(_mobileController.text.isEmpty){
                    saveData = false;
                    Fluttertoast.showToast(msg: "Please Enter Mobile Number");
                    return;
                  }
                  if(saveData){
                    _updateProfile();
                  }

                },
               text: "Update",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void getValue() async {
  //   var prefs = await SharedPreferences.getInstance();
  //
  //   var getName = prefs.getString(KEYNAME);
  //   var getEmail = prefs.getString(KEYEMAIL);
  //   var getDOB = prefs.getString(KEYDOB);
  //
  //   ProfileScreenState.nameValue = getName!;
  //   ProfileScreenState.emailValue = getEmail!;
  //   ProfileScreenState.dobValue = getDOB!;
  //
  //   setState(() {});
  // }
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Upload Image",
            style: const TextStyle(
              fontFamily: "Poppins_SemiBold",
              fontSize: 15,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text(
                   "Open Gallery",
                    style: const TextStyle(
                      fontFamily: "Poppins_Regular",
                      fontSize: 13,
                    ),
                  ),
                  onTap: () {
                    _openGallery(context);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: Text(
                    "Open Camera",
                    style: const TextStyle(
                        fontFamily: "Poppins_Regular", fontSize: 13),
                  ),
                  onTap: () {
                    _openCamera(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    var picture = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      path = picture!.path;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  void _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    var picture = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      path = picture!.path;
      Navigator.of(context).pop();
    });
  }



  _updateProfile() async {
    if (_nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter full name");
      return;
    }
    setState(() {
      _loading = true;
    });

    Login login = await ApiService.updateProfile(
      name: _nameController.text.toString(),
      email: _emailController.text.toString(),
      mobile: _mobileController.text.toString(),
      avatar: path != null ? File(path!) : null,
    );

    if (login.status != null &&
        login.status == "success" &&
        login.user != null) {
      if (mounted) {
        print("auth data upd profile>>>>${jsonEncode(login.user)}");
        await SharedPreferencesService.setAuthUser(authUser: login.user!);
        Fluttertoast.showToast(msg: login.message ?? "Update successfully")
            .then((value) =>  Navigator.pushNamed(context, DashboardScreen.routeName));
        SharedPreferencesService.setRegistered(registered: true);

      }
    } else {
      Fluttertoast.showToast(msg: "Failed to save address, Try again..");


    }
  }
}












// CustomButton(
// onTap: () async {
// Navigator.pushAndRemoveUntil(
// context,
// MaterialPageRoute(
// builder: (context) => DashboardScreen()),
// (route) => false);
// var prefs = await SharedPreferences.getInstance();
// prefs.setBool(SplashScreenState.KEYFORMFILLED, true);
// prefs.setBool(SplashScreenState.KEYLOGIN, true);
//
// prefs.setString(KEYNAME, _nameController.text.toString());
// prefs.setString(KEYEMAIL, _emailController.text.toString());
// prefs.setString(KEYDOB, _dobController.text.toString());
// },
// text: "Contineue",
// ),