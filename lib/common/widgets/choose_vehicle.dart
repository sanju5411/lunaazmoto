import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/packages/active_package.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';

class CustomWheelerPopUp extends StatefulWidget {
  static const String routeName = '/wheeler_popup';
  List<ActivePackage>? packageList;
   CustomWheelerPopUp({Key? key,  this.packageList}) : super(key: key);

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
                 //print("ttttttt>>>>${widget.packageList!.length}");
                 if(widget.packageList!.length < 0){
                   print("jjjjjj>>>>");
                   Navigator.pop(context);
                   Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
                 }
                 else{
                   var packageId = 0;
                   var packageExpiryDate =  "0";
                   for(var i = 0;i<widget.packageList!.length;i++){
                     if(widget.packageList![i].activeVehicleType == "two_wheeler"){
                       print("Status>>>${widget.packageList![i].activeStatus}");
                       if(widget.packageList![i].activeStatus == "activated"){
                         packageId = widget.packageList![i].activePackId!;
                         packageExpiryDate = widget.packageList![i].activeEndDate!;
                         Navigator.pop(context);
                         Navigator.pushNamed(context, BookingForm.routeName, arguments: {"packageId":packageId,"vehicleType":"two_wheeler","packageExpiryDate":packageExpiryDate});
                         return;
                       }
                       else if(widget.packageList![i].activeStatus == "completed"){
                         Navigator.pop(context);
                         Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
                       }
                       // else if(widget.packageList![i].activeStatus == "completed"){
                       //   Navigator.pop(context);
                       //   Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
                       // }
                       //
                     }
                   }

                 }
               },
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(17),
                       color: const Color(0xffff5050),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: const [


                         Icon(Icons.car_crash,color: CustomColor.whiteColor,),
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
                 print("wwwwwww>>>>${widget.packageList!.length}");
                 if(widget.packageList!.isEmpty){
                   Navigator.pop(context);
                   Navigator.pushNamed(context, BookingScreen.routeName,arguments: "four_wheeler",);
                 }
                 else{
                   var packageId = 1;
                   var packageExpiryDate =  "0";
                   for(var i = 0;i<widget.packageList!.length;i++){
                     if(widget.packageList![i].activeVehicleType == "four_wheeler"){
                       if(widget.packageList![i].activeStatus == "activated"){
                         packageId = widget.packageList![i].activePackId!;
                         packageExpiryDate = widget.packageList![i].activeEndDate!;
                         Navigator.pop(context);
                         Navigator.pushNamed(context, BookingForm.routeName, arguments: {"packageId":packageId,"vehicleType":"four_wheeler","packageExpiryDate":packageExpiryDate});
                         return;
                       }
                       else if(widget.packageList![i].activeStatus == "completed"){
                         Navigator.pop(context);
                         Navigator.pushNamed(context, BookingScreen.routeName,arguments: "four_wheeler",);
                       }

                       // else if(widget.packageList![i].activeStatus == "completed"){
                       //   Navigator.pop(context);
                       //   Navigator.pushNamed(context, BookingScreen.routeName,arguments: "two_wheeler",);
                       // }
                       //

                           }
                     else{
                       Navigator.pop(context);
                       Navigator.pushNamed(context, BookingScreen.routeName,arguments: "four_wheeler",);
                     }
                   }
                 }
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
