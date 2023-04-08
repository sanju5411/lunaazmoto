import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/drivers/booking_list_main_model.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/screens/bike_delivery/booking_detail/booking_detail.dart';
import 'package:lunaaz_moto/screens/bike_delivery/notification_screen/notification_screen.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:badges/badges.dart' as badges;

class TotalBookingScreen extends StatefulWidget {
  static const String routeName = '/total_booking_vehicle';
  const TotalBookingScreen({Key? key}) : super(key: key);
  @override
  State<TotalBookingScreen> createState() => _TotalBookingScreenState();
}

class _TotalBookingScreenState extends State<TotalBookingScreen> {

  bool isApiCalled = false;
  List<NewServices> newService = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getDataFromBookingApi(String type) async{

    Map<String, String> jsonInput = {
      "bookings" : type,
    };

    print('typee>>>${type}');
    BookingListMainModel driverMainModel = await ApiService.getBookingListWithKey(jsonInput: jsonEncode(jsonInput));
    print("<----$type booking List--->${jsonEncode(driverMainModel)}");
    if(driverMainModel.status != null){
      setState(() {
        isApiCalled = true;
        newService = driverMainModel.bookings!;
        isLoading = false;
      });
    }else{
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    final appBarTitle = ModalRoute.of(context)?.settings.arguments as String;

    print("Page Title-1 :: $isApiCalled");

    if(!isApiCalled){

      print("iugugug?>>>>><<<<");
      String type = "";
      if(appBarTitle == "Total Booking"){
        type = "total_bookings";
      }else if(appBarTitle == "Today My Booking"){
        type = "today_my_bookings";
      }else if(appBarTitle == "Today Pick Up"){
        type = "picked";
      }else if(appBarTitle == "Today Delivery"){
        type = "drop_to_customer";
      }
      else if(appBarTitle == "Today Booking"){
        type = "today_new_bookings";
      }
      print("<<<<<<<<<<<object>>>>>>>>>>>${type}");
      if(type != "") getDataFromBookingApi(type);
    }

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: Text(appBarTitle,style: TextStyle(fontSize: 19),),
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(
              Icons.arrow_back_outlined,color: CustomColor.whiteColor,
            ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10,top: 10),
            padding: const EdgeInsets.all(8.0,),
            child: InkWell(
              //onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),
                child:  badges.Badge(

                  badgeContent: Text('1',style: TextStyle(color: CustomColor.whiteColor),),
                  child: Icon(Icons.notifications),
                )
            ),
          ),
        ],
      ),
      body: isLoading ? Container(
        height: screenSize.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: CustomColor.whiteColor,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ): Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: CustomColor.whiteColor,
        ),
        child: SingleChildScrollView(
          physics:  const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text("Today",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              // ),
              // const SizedBox(height: 20,),
              // ListView.builder(
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: 3,
              //     itemBuilder: (BuildContext context, int index) {
              //       return  Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Container(
              //           margin: const EdgeInsets.all(8),
              //           decoration: BoxDecoration(
              //               color: Colors.white, // Your desired background color
              //               borderRadius: BorderRadius.circular(10),
              //               boxShadow: const [
              //                 BoxShadow(color: Color.fromRGBO(
              //                     209, 249, 255, 0.5058823529411764), blurRadius: 10),
              //               ]
              //           ),
              //           child:  InkWell(
              //             onTap: (){
              //               //Navigator.pushNamed(context, BookingDetail.routeName);
              //             },
              //             child: ListTile(
              //               contentPadding:
              //               const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15),
              //                 side: const BorderSide(
              //                   color: Colors.black,
              //                 ),
              //               ),
              //               leading: const CircleAvatar(
              //                 backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
              //               ),
              //               title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
              //               subtitle: const Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
              //               trailing: Column(
              //                 children: [
              //                   Icon(Icons.remove_red_eye,color: Colors.cyan,),
              //                   SizedBox(height: 10,),
              //                   Text("New Booking",style: TextStyle(color: Colors.deepPurpleAccent),)
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
              // const SizedBox(height: 35,),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text("Yesterday",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              // ),
              // const SizedBox(height: 20,),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newService.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      decoration: BoxDecoration(
                          color: Colors.white, // Your desired background color
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Color.fromRGBO(255, 164, 124,0.2), blurRadius: 10),
                          ]
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, BookingDetail.routeName,arguments: newService[index]);
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
                                          Text(newService[index].bookingVehName != null ?
                                          newService[index].bookingVehName!.toString():"",
                                            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                color: Color(
                                                    0xffffc0c0)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Text("${(newService[index].status.toString())}",style: TextStyle(fontSize: 17,color: CustomColor.primaryColor,fontWeight: FontWeight.w700),),
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
                                        Text(newService[index].bookingNumber.toString(),),
                                      ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(children: [
                                        const Text("Date -",style: TextStyle(fontSize: 20),),
                                        const SizedBox(width: 7,),
                                        Text(newService[index].bookingDate.toString()),
                                      ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Row(children: [
                                    const Text("Vehicle No :-",style: TextStyle(fontSize: 20),),
                                    const SizedBox(width: 7,),
                                    Text((newService[index].bookingVehNum.toString()),),
                                  ],),
                                  const SizedBox(height: 10,),
                                  Row(children: [
                                    Text("Payment :-",style: TextStyle(fontSize: 19),),
                                    SizedBox(width: 5,),
                                    Text((newService[index].bookingPaymentStatus.toString()),style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w700,fontSize: 17),),


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
                      ),
                    );
                  }),



            ],),
        ),
      ),
    );
  }
}
