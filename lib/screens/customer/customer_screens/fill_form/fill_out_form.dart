import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillformScreen extends StatefulWidget {
  static const String routeName = '/fill_out_form';

  const FillformScreen({Key? key}) : super(key: key);

  @override
  State<FillformScreen> createState() => FillformScreenState();
}

class FillformScreenState extends State<FillformScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  static const String KEYNAME = "name";
  static const String KEYEMAIL = "email";
  static const String KEYDOB = "dob";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
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
              // TextFormField(
              //   controller: _dobController,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           width: 1, color: Colors.black), //<-- SEE HERE
              //     ),
              //     suffixIcon: InkWell(
              //       onTap: () {
              //         _showDatePicker();
              //       },
              //       child: Icon(
              //         Icons.calendar_month,
              //         color: CustomColor.primaryColor,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //           width: 1, color: Colors.black), //<-- SEE HERE
              //     ),
              //     labelText: 'date of birth',
              //     hintText: "DOB",
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(),
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 71,vertical: 19),
                    child: Text(_dateTime.toString(),),
                  )),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                onTap: () async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()),
                      (route) => false);
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashScreenState.KEYFORMFILLED, true);
                  prefs.setBool(SplashScreenState.KEYLOGIN, true);

                  prefs.setString(KEYNAME, _nameController.text.toString());
                  prefs.setString(KEYEMAIL, _emailController.text.toString());
                  prefs.setString(KEYDOB, _dobController.text.toString());
                },
                text: "Contineue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getValue() async {
    var prefs = await SharedPreferences.getInstance();

    var getName = prefs.getString(KEYNAME);
    var getEmail = prefs.getString(KEYEMAIL);
    var getDOB = prefs.getString(KEYDOB);

    ProfileScreenState.nameValue = getName!;
    ProfileScreenState.emailValue = getEmail!;
    ProfileScreenState.dobValue = getDOB!;

    setState(() {});
  }
}
