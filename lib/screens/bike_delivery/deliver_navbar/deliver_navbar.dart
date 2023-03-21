
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';

class DeliverNavBat extends StatelessWidget {
  const DeliverNavBat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUser? _authUser;

    Size screenSize = MediaQuery.of(context).size;

    return Drawer(
     // width:100,
      child: ListView(

        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(

                  backgroundImage: AssetImage("assets/images/dpp.jpg"),
                ),
                SizedBox(height: 25,),
                Text(  _authUser != null ? _authUser!.name!.toString(): 'LunaazMoto',style: TextStyle(fontSize: 30,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),)

              ],),
            decoration: BoxDecoration(
                color: CustomColor.primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
            ),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.pushNamed(context, ProfileScreen.routeName)
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text("Setting"),),)))
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              SharedPreferencesService.setLoggedIn(loggedIn: false),
              Navigator.pushNamed(context, LoginScreen.routeName),
            },
          )

        ],
      ),
    );
  }
}
