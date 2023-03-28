import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';

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
      backgroundColor: const Color(0x73d9d9d9),
      body: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        title: const Text("Please select service"),

        actionsAlignment: MainAxisAlignment.center,
        actions: [
         Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [

           SizedBox(
             height: 8,
           ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Color(0xffff5050)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                    Icon(Icons.pedal_bike,color: CustomColor.whiteColor,),
                      SizedBox(width: 20,),
                      Text("Bike Service",style: TextStyle(fontSize: 23,color: CustomColor.whiteColor),),
                  ],),
                ),
              ),
            ),
          ),
           SizedBox(
             height: 10,
           ),
             InkWell(
               onTap: (){
                 Navigator.pop(context);
                 Navigator.pushNamed(context, BookingScreen.routeName,arguments: "four_wheeler",);
               },
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(17),
                       color: const Color(0xffff5050)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: const [


                         Icon(Icons.car_crash,color: CustomColor.whiteColor,),
                         SizedBox(width: 20,),
                         Text("Car Wash",style: TextStyle(fontSize: 23,color: CustomColor.whiteColor),),
                       ],),
                   ),
                 ),
               ),
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


// onTap: (){
// Navigator.pop(context);
// Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
// },
