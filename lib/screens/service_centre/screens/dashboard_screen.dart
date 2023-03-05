import 'package:flutter/material.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';

class ServiceDashboard extends StatefulWidget {
  static const String routeName = '/service_centre';

  const ServiceDashboard({Key? key}) : super(key: key);

  @override
  State<ServiceDashboard> createState() => _ServiceDashboardState();
}

class _ServiceDashboardState extends State<ServiceDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Service Centre",
            style: TextStyle(color: Colors.deepOrange, fontSize: 38),
          )),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                      },
              child: Text("LogOut"),
            ),
          ),
        ],
      ),
    );
  }
}
