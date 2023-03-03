import 'package:flutter/material.dart';

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
      body: Container(
        child: Center(child: Text("Service Centre",style: TextStyle(color: Colors.deepOrange,fontSize: 38),)),
      ),
    );
  }
}
