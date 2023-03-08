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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Delivery_dashboard",style: TextStyle(
                fontSize: 40,color: Colors.deepOrange,
              ),),
              SizedBox(height: 30,),
              Container(
                color: Colors.red,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text("Log Out",style: TextStyle(color: Colors.white),),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
