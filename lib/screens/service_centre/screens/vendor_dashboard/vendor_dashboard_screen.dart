import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/models/serviceModule/dashboard/ServiceCentersMainModel.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/customer_list/customer_common_list.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/navVendorBar/vendor_nav_bar.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:badges/badges.dart' as badges;

import '../CustomerBookingDetail/service_completed.dart';

class ServiceDashboard extends StatefulWidget {
  static const String routeName = '/service_centre';

  final String appBartitle;
  const ServiceDashboard({Key? key,  required this.appBartitle}) : super(key: key);

  @override
  State<ServiceDashboard> createState() => _ServiceDashboardState();
}

class _ServiceDashboardState extends State<ServiceDashboard> {

  int totalServiceCount = 0;
  int pendingServiceCount = 0;
  int inProcessServiceCount = 0;
  int completedServiceCount = 0;
  int canceledServiceCount = 0;
  List<NewServices> newService = [];



  void _setServiceDashData() async {

    ServiceCentersMainModel serviceCentersMainModel = await ApiService.getServiceCenterDashboardData();
    print("Service Centers Main Model--->${jsonEncode(serviceCentersMainModel)}");
    if(serviceCentersMainModel.status == "success"){
      setState(() {
        totalServiceCount = serviceCentersMainModel.totalServices!;
        pendingServiceCount = serviceCentersMainModel.newServices!;
        inProcessServiceCount = serviceCentersMainModel.inProccessServices!;
        completedServiceCount = serviceCentersMainModel.completedServices!;
        canceledServiceCount = serviceCentersMainModel.todayRejectedServices!;
        newService = serviceCentersMainModel.nextServices!;
      });
    }
   print("service dashboard data>>>>>${jsonEncode(serviceCentersMainModel)}>>>>");




  }

  @override
  void initState() {
    super.initState();
    _setServiceDashData();
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
          // leading: Icon(Icons.menu),

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
        drawer: VendorNavDrawer(),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome To,",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
                    SizedBox(height: 10,),
                    Text("Service Center",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: CustomColor.whiteColor),),

                  ],),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(

                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            //here we add let long
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(color: CustomColor.primaryColor,borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.filter_list_alt,
                                  color: CustomColor.whiteColor,
                                ),
                              ),
                            ),
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search",

                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(height: 25,),
              Container(
                  decoration: const BoxDecoration(
                      color: CustomColor.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Today’s Process",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),)),
                            ],
                          )
                      ),
                      const SizedBox(height: 20,),

                      Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         InkWell(
                           onTap: (){
                             if(totalServiceCount != 0) {
                               Navigator.pushNamed(
                                   context, CustomerCommonList.routeName,
                                   arguments: "Total Services");
                             }else{
                               Fluttertoast.showToast(msg: "No Bookings Found");
                             }
                           },
                           child: Stack(
                             children: [
                               Positioned(
                                 left: 20,
                                   child: Container(
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xFF712AFD)),
                                 child: Padding(
                                   padding: const EdgeInsets.all(12),
                                   child: Text("$totalServiceCount",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                 ),
                               )),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 30),
                                 child: Container(
                                     height: 110,
                                     width: screenSize.width * 0.45,
                                     decoration:  BoxDecoration(
                                         border: Border.all(color: const Color(0xFF712AFD)),
                                         borderRadius: const BorderRadius.all(Radius.circular(16))
                                     ),
                                     child:  Align(
                                         alignment: Alignment.bottomLeft,
                                         child: Padding(
                                           padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                                           child: Text("Total\nServices",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                                         ))

                                 ),
                               ),
                             ],
                           ),
                         ),

                         InkWell(
                           onTap: (){
                             if(pendingServiceCount != 0){
                             Navigator.pushNamed(context, CustomerCommonList.routeName,arguments: "Pending Services");
                             }else{
                               Fluttertoast.showToast(msg: "No Bookings Found");
                             }
                           },
                           child: Stack(
                             children: [
                               Positioned(
                                   left: 20,
                                   child: Container(
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xFFFBB01E)),
                                     child: Padding(
                                       padding: const EdgeInsets.all(12),
                                       child: Text("$pendingServiceCount",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                     ),
                                   )),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 30),
                                 child: Container(
                                     height: 110,
                                     width: screenSize.width * 0.45,
                                     decoration:  BoxDecoration(
                                         border: Border.all(color: const Color(0xFFFBB01E)),
                                         borderRadius: const BorderRadius.all(Radius.circular(16))
                                     ),
                                     child:  Align(
                                         alignment: Alignment.bottomLeft,
                                         child: Padding(
                                           padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
                                           child: Text("Pending\nServices",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                                         ))

                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],),
                     ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          InkWell(
                            onTap: (){
                              if(inProcessServiceCount != 0){
                              Navigator.pushNamed(context, CustomerCommonList.routeName,arguments: "In Progress Services");
                              }else{
                                Fluttertoast.showToast(msg: "No Bookings Found");
                              }
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xff31BE40)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("$inProcessServiceCount",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 110,
                                      width: screenSize.width * 0.280,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xff31BE40)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 25,left: 20),
                                            child: Text("In Process\nServices",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                          ))

                                  ),
                                ),
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              if(completedServiceCount != 0){
                                Navigator.pushNamed(context, CustomerCommonList.routeName,arguments: "Completed Services");
                              }else{
                                Fluttertoast.showToast(msg: "No Bookings Found");
                              }
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(
                                          0xFFFF623A)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("$completedServiceCount",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 110,
                                      width: screenSize.width * 0.315,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xFFFF623A)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 20,left: 20),
                                            child: Text("Completed\nService",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                                          ))

                                  ),
                                ),
                              ],
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              if(canceledServiceCount != 0) {
                                Navigator.pushNamed(
                                    context, CustomerCommonList.routeName,
                                    arguments: "Canceled Services");
                              }else{
                                Fluttertoast.showToast(msg: "No Bookings Found");
                              }
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(
                                          0xFFFF2121)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("$canceledServiceCount",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 110,
                                      width: screenSize.width * 0.280,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xFFFF2121)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 20,left: 20),
                                            child: Text("Canceled\nService",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                                          ))

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],),
                      ),

                      const SizedBox(height: 20,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Next Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              GestureDetector(
                                  onTap: (){

                                  },
                                  child: Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),)),
                            ],
                          )
                      ),
                      const SizedBox(height: 20,),
                      if(newService.isNotEmpty)...[
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return  GestureDetector(
                                onTap: (){

                                },
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                                  child: Container(
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(ApiConfig.baseUrl+newService[index].bookingUser!.avatar.toString()),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 5,),
                                            Row(
                                              children: [
                                                Text("${newService[index].bookingAddress?.name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black),),
                                                SizedBox(width: 100,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFE8F0FF),
                                                      border: Border.all(
                                                        color: Color(0xFFE8F0FF),
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                                  ),
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text("Pending",style: TextStyle(color: Color(0xFF1D3A70)),),
                                                ),
                                              ],
                                            ),
                                            Text("${newService[index].bookingVehName}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Color(0xFF646464)),),
                                            HtmlWidget(
                                              (newService[index].bookingPackage!.packageFeaturesName!.toString()).toString(),
                                              textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Color(0xFF848484)),
                                            ),
                                            Text("${newService[index].bookingDriver!.name}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Color(0xFF848484)),),
                                            Text("${newService[index].bookedDate}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Color(0xFF848484)),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${newService[index].bookedTime}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Color(0xFF848484)),),
                                                SizedBox(width: 100,),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Text("View Details",style: TextStyle(color: Color(0xFF820000)),),
                                                    Icon(Icons.arrow_forward,color: Color(0xFF820000),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ]else...[
                        SizedBox(
                          height: 100,
                          child: Align(
                            child: Text("No Service For Now",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w500),),
                          ),
                        )
                      ]
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
