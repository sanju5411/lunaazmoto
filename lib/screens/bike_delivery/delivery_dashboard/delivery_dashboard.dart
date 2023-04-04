import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/screens/bike_delivery/booking_detail/booking_detail.dart';
import 'package:lunaaz_moto/screens/bike_delivery/deliver_navbar/deliver_navbar.dart';
import 'package:lunaaz_moto/screens/bike_delivery/total_booking_screen/total_booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';
import 'package:badges/badges.dart' as badges;
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
  int? todayBookingCount =0;
  List<NewServices> nextBooking = [];
  String userImage = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDriverDashboard();
  }

  getDriverDashboard() async{
    DriverMainModel driverMainModel = await ApiService.getDriverDashboardData();
    AuthUser authUser = await SharedPreferencesService.getAuthUserData();
    print("Drive Main Model---->${jsonEncode(driverMainModel)}");
    setState(() {
      todayNewBooking = driverMainModel.todayBookings;
      totalBooking = driverMainModel.totalBookings;
      todayDelivered = driverMainModel.todayDeliveredBookings;
      todayPickUp = driverMainModel.todayPickedBookings;
      todayBookingCount = driverMainModel.todayMyBookings;
      nextBooking = driverMainModel.newServices!;
      userImage = ApiConfig.baseUrl+authUser.avatar.toString();
    });

  }

  Future<void> _onRefresh() async {
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
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Scaffold(
          backgroundColor: CustomColor.primaryColor,
          appBar: AppBar(
            backgroundColor: CustomColor.primaryColor,
            elevation: 0,
            title: Column(
              children: const [
                SizedBox(height: 5,),
                Text("Lunazmoto",style: TextStyle(color: CustomColor.whiteColor),

                ),
                


              ],
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                 // onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),
                  child:  badges.Badge(

                    badgeContent: Text('1',style: TextStyle(color: CustomColor.whiteColor),),
                    child: Icon(Icons.notifications),
                  )
                ),
              ),
              const SizedBox(width: 15,)
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
                         // Text("LunaazMoto",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                         // SizedBox(height: 10,),
                         Text("Lunazmoto Delivery Person",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: CustomColor.whiteColor),),

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
                                 children: [
                                   Text("Today's Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                   GestureDetector(
                                       onTap: (){
                                         if(int.parse(totalBooking.toString()) > 0){
                                           Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Total Booking");
                                         }else{
                                           Fluttertoast.showToast(msg: "No Data Found");
                                         }
                                       },
                                       child: Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),)),
                                 ],
                               )
                           ),
                           const SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 GestureDetector(
                                   onTap: (){
                                     if(int.parse(todayNewBooking.toString()) > 0){
                                       Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Today Booking");
                                     }else{
                                       Fluttertoast.showToast(msg: "No Data Found");
                                     }
                                   },
                                   child: Container(
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
                                           Text("${todayNewBooking}",style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFF6FC11D)),),
                                           SizedBox(height: 10,),
                                           Text("Today\nBooking",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                         ],
                                       )
                                   ),
                                 ),
                                 GestureDetector(
                                   onTap: (){
                                     if(int.parse(todayPickUp.toString()) > 0){
                                       Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Today Pick Up");
                                     }else{
                                       Fluttertoast.showToast(msg: "No Data Found");
                                     }
                                   },
                                   child: Container(
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
                                 ),
                                 GestureDetector(
                                   onTap: (){
                                     if(int.parse(todayDelivered.toString()) > 0){
                                       Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Today Delivery");
                                     }else{
                                       Fluttertoast.showToast(msg: "No Data Found");
                                     }
                                   },
                                   child: Container(
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
                                           const Text("Today's\nDelivered",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                         ],
                                       )
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 20,),
                           Container(
                               margin: const EdgeInsets.symmetric(horizontal: 20),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text("New Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                   GestureDetector(
                                       onTap: (){
                                         if(int.parse(totalBooking.toString()) > 0){
                                           Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Total Booking");
                                         }else{
                                           Fluttertoast.showToast(msg: "No Data Found");
                                         }
                                       },
                                       child: Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),)),
                                 ],
                               )
                           ),
                           const SizedBox(height: 20,),
                           if(nextBooking.isNotEmpty)...[
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
                                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                                       child: Container(
                                         //height: screenSize.height * 0.18,
                                         width: screenSize.width,
                                         decoration:  BoxDecoration(
                                             color: CustomColor.whiteColor,
                                             boxShadow: const
                                             [
                                               BoxShadow(
                                                 color: Color(0xffe1e1e1),
                                                 offset: Offset(
                                                   1.0,
                                                   1.0,
                                                 ),
                                                 blurRadius: 19.0,
                                                 spreadRadius: 1.0,
                                               ), //BoxShadow
                                               BoxShadow(
                                                 color: Colors.white,
                                                 offset: Offset(0.0, 0.0),
                                                 blurRadius: 0.0,
                                                 spreadRadius: 0.0,
                                               ), //BoxShadow
                                             ],
                                             borderRadius: BorderRadius.circular(20)
                                         ),
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children:  [
                                                   const SizedBox(height: 4,),
                                                   Row(
                                                     children: [
                                                       Text(nextBooking[index].bookingVehName != null ?
                                                       nextBooking[index].bookingVehName!.toString():"",
                                                         style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                                       Spacer(),
                                                       Container(
                                                         decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(17),
                                                             color: Color(
                                                                 0xffffc0c0)),
                                                         child: Padding(
                                                           padding: const EdgeInsets.all(7.0),
                                                           child: Text("${(nextBooking[index].status.toString())}",style: TextStyle(fontSize: 17,color: CustomColor.primaryColor,fontWeight: FontWeight.w700),),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                   const SizedBox(height: 3,),
                                                   Divider(color: Colors.black,),
                                                   const SizedBox(height: 3,),
                                                   Row(children: [
                                                     const Text("Reference Number -",style: TextStyle(fontSize: 20),),
                                                     const SizedBox(width: 7,),
                                                     Text(nextBooking[index].bookingNumber.toString(),),
                                                   ],
                                                   ),
                                                   SizedBox(height: 10,),
                                                   Row(children: [
                                                     const Text("Date -",style: TextStyle(fontSize: 20),),
                                                     const SizedBox(width: 7,),
                                                     Text(nextBooking[index].bookingDate.toString()),
                                                   ],
                                                   ),
                                                 ],
                                               ),
                                               const SizedBox(height: 10,),

                                               Row(children: [
                                                 const Text("Vehicle No :-",style: TextStyle(fontSize: 20),),
                                                 const SizedBox(width: 7,),
                                                 Text((nextBooking[index].bookingVehNum.toString()),),
                                               ],),
                                               const SizedBox(height: 10,),
                                               Row(children: [
                                                 Text("Payment :-",style: TextStyle(fontSize: 19),),
                                                 SizedBox(width: 5,),
                                                 Text((nextBooking[index].bookingPaymentStatus.toString()),style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w700,fontSize: 17),),


                                               ],),
                                               const SizedBox(height: 4,),
                                               Divider(),
                                               const SizedBox(height: 4,),
                                               Align(
                                                 alignment: Alignment.bottomCenter,
                                                 child: Padding(
                                                   padding: const EdgeInsets.all(2.0),
                                                   child: Text("View Detail",style: TextStyle(fontSize: 18,color: Colors.cyan,fontWeight: FontWeight.w800),),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   );
                                 }),
                           ]else...[
                              Container(
                                color: Colors.white,
                                height: screenSize.height/2.5,
                                child: Center(
                                  child: Text("No Data Found",style: TextStyle(color:Colors.red,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              )
                           ]
                         ],
                       )
                   ),
                 ],
               ),
               Positioned(
                 top: 80,
                 left: 20,
                 child:  GestureDetector(
                   onTap: (){
                     if(int.parse(totalBooking.toString()) > 0){
                       Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Total Booking");
                     }else{
                       Fluttertoast.showToast(msg: "No Data Found");
                     }
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
                 top: 80,
                 right: 20,
                 child:  GestureDetector(
                   onTap: (){
                     if(int.parse(todayBookingCount.toString()) > 0){
                       Navigator.pushNamed(context, TotalBookingScreen.routeName,arguments: "Today My Booking");
                     }else{
                       Fluttertoast.showToast(msg: "No Data Found");
                     }

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
                             "Today My Booking",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                           const SizedBox(height: 13,),
                           Text("$todayBookingCount",textAlign: TextAlign.center,style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.orange),),

                         ],
                       )
                   ),
                 ),
               ),

             ],
            ),
          ),
        ),
      ),
    );
  }


}
