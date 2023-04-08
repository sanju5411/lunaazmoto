import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/services/api_service.dart';

import '../../../../common/widgets/custom_button.dart';

class ServiceCenterBookingDone extends StatefulWidget {
  static const String routeName = '/service_complete_screen';

  const ServiceCenterBookingDone({Key? key}) : super(key: key);

  @override
  State<ServiceCenterBookingDone> createState() => _ServiceCenterBookingDone();
}

class _ServiceCenterBookingDone extends State<ServiceCenterBookingDone>{

  changeBookingStatus(String status, int bookingId) async {
    Map<String, String> jsonInput = {
      "status": status,
    };
    BookingList bookingList = await ApiService.changeServiceStatus(
        bookingId: bookingId, jsonInput: jsonEncode(jsonInput));
    print("Change Booking Status--->${jsonEncode(bookingList)}");
    if (bookingList.status == "success") {
      if(status == "service_completed"){
        setState(() {
          Navigator.pushNamed(context, ServiceCenterBookingDone.routeName);
        });
      }
      Fluttertoast.showToast(msg: "${bookingList.message}");
    } else if (bookingList.status == null) {}
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final _bookingData = ModalRoute.of(context)?.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  child: Image.asset("assets/images/completed.png")
              ),
              SizedBox(height: 20,),
              Text("Completed!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28,color: CustomColor.primaryColor),),
              SizedBox(height: 40,),
              Text("You have sucessfully applied for a loan. A response will be sent shortly.!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: CustomColor.doneTextColor),),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: 'Request to pickup',
                  onTap: () {
                    changeBookingStatus("service_completed", int.parse(_bookingData));
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}