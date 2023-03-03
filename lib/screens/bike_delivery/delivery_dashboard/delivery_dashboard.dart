import 'package:flutter/material.dart';

class DeliveryDashboard extends StatefulWidget {
  static const String routeName = '/delivery_vehicle';

  const DeliveryDashboard({Key? key}) : super(key: key);

  @override
  State<DeliveryDashboard> createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Delivery_dashboard",style: TextStyle(
            fontSize: 40,color: Colors.deepOrange,
          ),),
        ),
      ),
    );
  }
}
