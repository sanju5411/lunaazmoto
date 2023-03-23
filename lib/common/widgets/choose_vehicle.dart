import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';

class CustomWheelerPopUp extends StatefulWidget {
  static const String routeName = '/wheeler_popup';

  const CustomWheelerPopUp({Key? key}) : super(key: key);

  @override
  State<CustomWheelerPopUp> createState() => _CustomWheelerPopUpState();
}

class _CustomWheelerPopUpState extends State<CustomWheelerPopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x7ea8a8a8),
      body: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        title: Text("Select :-"),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [

           SizedBox(
             height: 10,
           ),
           InkWell(
             onTap: (){
               Navigator.pop(context);
               Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler");
             },
             child: Container(
               width: 150,
                 decoration: BoxDecoration(color: CustomColor.primaryColor,borderRadius: BorderRadius.circular(13),),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(
                       "Bike Service",
                       style: TextStyle(
                           fontSize: 20,
                           color: CustomColor.whiteColor,
                           fontWeight: FontWeight.w700),
                     ),
                   ),
                 )),
           ),
           SizedBox(
             height: 10,
           ),
             InkWell(
               onTap: (){
                 Navigator.pop(context);
                 Navigator.pushNamed(context, BookingScreen.routeName,arguments: "four_wheeler");
               },
               child: Container(
                 width: 150,
                   decoration: BoxDecoration(color: CustomColor.primaryColor,borderRadius: BorderRadius.circular(13),),
                   child: const Padding(
                     padding:  EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                     child: Align(
                       alignment: Alignment.center,
                       child: Text(
                        "Car Wash",
                         style: TextStyle(
                             fontSize: 20,
                             color: CustomColor.whiteColor,
                             fontWeight: FontWeight.w700),
                       ),
                     ),
                   )),
             ),
           SizedBox(
             height: 10,
           ),
         ],)
        ],
      )
    );
  }
}
