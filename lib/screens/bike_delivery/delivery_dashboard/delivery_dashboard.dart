import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/screens/bike_delivery/booking_detail/booking_detail.dart';
import 'package:lunaaz_moto/screens/bike_delivery/deliver_navbar/deliver_navbar.dart';
import 'package:lunaaz_moto/screens/bike_delivery/total_booking_screen/total_booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';

import '../../../constants/global_variables.dart';
import '../../../models/drivers/drivers_main_model.dart';
import '../../../models/drivers/new_services.dart';
import '../../../services/api_service.dart';

class DeliveryDashboard extends StatefulWidget {
  static const String routeName = '/deliver_person_dashboard';

  const DeliveryDashboard({Key? key}) : super(key: key);

  @override
  State<DeliveryDashboard> createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {

  int? totalBooking =0;
  int? todayNewBooking =0;
  int? todayPickUp =0;
  int? todayDelivered =0;
  List<NewServices> nextBooking = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDriverDashboard();
  }

  void getDriverDashboard() async{
    DriverMainModel driverMainModel = await ApiService.getDriverDashboardData();
    print("Drive Main Model---->${jsonEncode(driverMainModel)}");
    setState(() {
      todayNewBooking = driverMainModel.todayBookings;
      totalBooking = driverMainModel.totalBookings;
      todayDelivered = driverMainModel.todayDeliveredBookings;
      todayPickUp = driverMainModel.todayPickedBookings;
      nextBooking = driverMainModel.newServices!;
    });

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        appBar: AppBar(
          backgroundColor: CustomColor.primaryColor,
          elevation: 0,
          title: Column(
            children: const [
              SizedBox(height: 5,),
              Text("Lunaaz Moto",style: TextStyle(color: CustomColor.whiteColor),

              ),
              SizedBox(height: 6,),
              Text("Dhaka",style: TextStyle(color: CustomColor.whiteColor),

              ),
            ],
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),
              child: const CircleAvatar(

                backgroundImage: AssetImage("assets/images/dpp.jpg"),

              ),
            ),
            SizedBox(width: 15,)
          ],
        ),
        drawer: DeliverNavBat(),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Stack(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                       Text("LunaazMoto",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                       SizedBox(height: 10,),
                       Text("Deliver Person",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: CustomColor.whiteColor),),

                     ],),
                 ),
                 const SizedBox(height: 80,),
                 Container(
                     width: screenSize.width,
                     decoration: const BoxDecoration(
                         color: CustomColor.whiteColor,
                         borderRadius: BorderRadius.only(
                           topRight: Radius.circular(20),
                           topLeft: Radius.circular(20),
                         )
                     ),
                     child: Column(
                       children: [
                         const SizedBox(height: 50,),
                         Container(
                             margin: const EdgeInsets.symmetric(horizontal: 20),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: const [
                                 Text("Today's Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                 Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),),
                               ],
                             )
                         ),
                         const SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Container(
                                   height: 110,
                                   width: 110,
                                   decoration:  BoxDecoration(
                                       border: Border.all(color: const Color(0xFFA5D872)),
                                       borderRadius: const BorderRadius.all(Radius.circular(20))
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text("${totalBooking}",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFF6FC11D)),),
                                       SizedBox(height: 10,),
                                       Text("Today\nBooking",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                     ],
                                   )
                               ),
                               Container(
                                   height: 110,
                                   width: 110,
                                   decoration:  BoxDecoration(
                                       border: Border.all(color: const Color(0xFFEFA315)),
                                       borderRadius: const BorderRadius.all(Radius.circular(20))
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text("${todayPickUp}",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFFEFA315)),),
                                       SizedBox(height: 10,),
                                       Text("Today\nPicked Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                     ],
                                   )
                               ),
                               Container(
                                   height: 110,
                                   width: 110,
                                   decoration:  BoxDecoration(
                                       border: Border.all(color: const Color(0xFFFF2121)),
                                       borderRadius: const BorderRadius.all(Radius.circular(20))
                                   ),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text("$todayDelivered",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFFFF2121)),),
                                       const SizedBox(height: 10,),
                                       const Text("Today\nBooking",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                     ],
                                   )
                               ),
                             ],
                           ),
                         ),
                         const SizedBox(height: 20,),
                         Container(
                             margin: const EdgeInsets.symmetric(horizontal: 20),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: const [
                                 Text("Next Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                 Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),),
                               ],
                             )
                         ),
                         const SizedBox(height: 20,),
                         ListView.builder(
                             physics: const NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             itemCount: nextBooking.length,
                             itemBuilder: (BuildContext context, int index) {
                               return  GestureDetector(
                                 onTap: (){
                                   Navigator.pushNamed(context, BookingDetail.routeName,arguments: nextBooking[index]);
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 20),
                                   child: Container(
                                     margin: const EdgeInsets.all(8),
                                     decoration: BoxDecoration(
                                         color: Colors.white, // Your desired background color
                                         borderRadius: BorderRadius.circular(10),
                                         boxShadow: const [
                                           BoxShadow(color: Color.fromRGBO(255, 164, 124,0.2), blurRadius: 10),
                                         ]
                                     ),
                                     child: ListTile(
                                       contentPadding:
                                       const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(15),
                                         side: const BorderSide(
                                           color: Colors.black,
                                         ),
                                       ),
                                       leading: const CircleAvatar(
                                         backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                                       ),
                                       title: Text("${nextBooking[index].bookingUser?.name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                                       subtitle: Text("${nextBooking[index].bookedDate}, ${nextBooking[index].bookedTime}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                                     ),
                                   ),
                                 ),
                               );
                             }),
                       ],
                     )
                 ),
               ],
             ),
             Positioned(
               top: 120,
               left: 20,
               child:  GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Total Booking");
                 },
                 child: Container(
                   height: 110,
                     width: 150,
                   decoration:  BoxDecoration(
                     color: CustomColor.whiteColor,
                       border: Border.all(color: const Color(0xFFA5D872)),
                       borderRadius: const BorderRadius.all(Radius.circular(13))
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:  [

                       const Text("Total Booking",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                       const SizedBox(height: 13,),
                       Text("$totalBooking",textAlign: TextAlign.center,style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.lightGreen),),

                     ],
                   )
             ),
               ),
             ),
             Positioned(
               top: 120,
               right: 20,
               child:  GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Today Booking");
                 },
                 child: Container(
                     height: 110,
                     width: 150,
                     decoration:  BoxDecoration(
                         color: CustomColor.whiteColor,
                         border: Border.all(color: const Color(0xFFA5D872)),
                         borderRadius: const BorderRadius.all(Radius.circular(13))
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  [
                         Text(
                           textAlign: TextAlign.center,
                           "Today\nNew Booking",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                         const SizedBox(height: 13,),
                         Text("$todayNewBooking",textAlign: TextAlign.center,style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.orange),),

                       ],
                     )
                 ),
               ),
             ),

           ],
          ),
        ),
      ),
    );
  }


}
