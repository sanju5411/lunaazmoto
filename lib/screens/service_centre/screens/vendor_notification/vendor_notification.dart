import 'package:flutter/material.dart';
class VendorNotification extends StatefulWidget {

  static const String routeName = 'vendorr_notification';
  const VendorNotification({Key? key}) : super(key: key);

  @override
  State<VendorNotification> createState() => _VendorNotificationState();
}

class _VendorNotificationState extends State<VendorNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Vendor Notification",style: TextStyle(color: Colors.red,fontSize: 30),),),
    );
  }
}
