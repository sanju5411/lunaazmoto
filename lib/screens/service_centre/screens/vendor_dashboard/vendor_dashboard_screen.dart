import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/customer_list/customer_common_list.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/navVendorBar/vendor_nav_bar.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:badges/badges.dart' as badges;

class ServiceDashboard extends StatefulWidget {
  static const String routeName = '/service_centre';

  final String appBartitle;
  const ServiceDashboard({Key? key,  required this.appBartitle}) : super(key: key);

  @override
  State<ServiceDashboard> createState() => _ServiceDashboardState();
}

class _ServiceDashboardState extends State<ServiceDashboard> {



  void _setServiceDashData() async {

    //ServiceCenters _serviceCenters = await ApiService.getServiceDashboard("service-center");
   // print("service dashboard data>>>>>${jsonEncode(_serviceCenters)}>>>>");


    // if(bookingList.status  == "success"){
    //   onGoingList = bookingList!.onGoingBookings!;
    //   lastBookings = bookingList!.bookings!;
    //   setState(() {
    //     loading = false;
    //   });
    // }

  }

  @override
  void initState() {

   // _setServiceDashData();

    super.initState();
    //  WidgetsBinding.instance.addObserver(this);
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
                  children: const [

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
                      const SizedBox(height: 40,),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Today’s Process",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),),
                            ],
                          )
                      ),
                      const SizedBox(height: 20,),


                      Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                       child: Row(children: [
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                             // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                           },
                           child: Stack(
                             children: [
                               Positioned(
                                 left: 20,

                                   child: Container(
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xff712AFD)),
                                 child: Padding(
                                   padding: const EdgeInsets.all(12),
                                   child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                 ),
                               )),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 30),
                                 child: Container(
                                     height: 90,
                                     width: screenSize.width * 0.4,
                                     decoration:  BoxDecoration(
                                         border: Border.all(color: const Color(0xff712AFD)),
                                         borderRadius: const BorderRadius.all(Radius.circular(16))
                                     ),
                                     child:  Align(
                                         alignment: Alignment.bottomLeft,
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text("New\nServices",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                         ))

                                 ),
                               ),
                             ],
                           ),
                         ),
                         Spacer(),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                             // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                           },
                           child: Stack(
                             children: [
                               Positioned(
                                   left: 20,

                                   child: Container(
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xffFBB01E)),
                                     child: Padding(
                                       padding: const EdgeInsets.all(12),
                                       child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                     ),
                                   )),
                               Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 30),
                                 child: Container(
                                     height: 90,
                                     width: screenSize.width * 0.4,
                                     decoration:  BoxDecoration(
                                         border: Border.all(color: const Color(0xffFBB01E)),
                                         borderRadius: const BorderRadius.all(Radius.circular(16))
                                     ),
                                     child:  Align(
                                         alignment: Alignment.bottomLeft,
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text("New\nServices",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                         ))

                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],),
                     ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                              // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,

                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xff31BE40)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 90,
                                      width: screenSize.width * 0.280,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xff31BE40)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("New\nServices",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                          ))

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                              // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,

                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(
                                          0xfffd8f72)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 90,
                                      width: screenSize.width * 0.280,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xfffd8f72)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("New\nServices",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                          ))

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                              // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                            },
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 20,

                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),color: Color(0xffFF623A)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30),
                                  child: Container(
                                      height: 90,
                                      width: screenSize.width  * 0.280,
                                      decoration:  BoxDecoration(
                                          border: Border.all(color: const Color(0xffFF623A)),
                                          borderRadius: const BorderRadius.all(Radius.circular(16))
                                      ),
                                      child:  Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("New\nServices",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
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
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
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
                                              SizedBox(
                                                width: 120,
                                                child: AutoSizeText("ccccccc",
                                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                              ),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(17),
                                                    color: Color(
                                                        0xffffc0c0)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(7.0),
                                                  child: Text("etaebaeg",style: TextStyle(fontSize: 17,color: CustomColor.primaryColor,fontWeight: FontWeight.w700),),
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
                                            Text("zbbabgagawgga"),
                                          ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(children: [
                                            const Text("Date -",style: TextStyle(fontSize: 20),),
                                            const SizedBox(width: 7,),
                                            Text("zhthahahraear"),
                                          ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10,),

                                      Row(children: [
                                        const Text("Vehicle No :-",style: TextStyle(fontSize: 20),),
                                        const SizedBox(width: 7,),
                                        Text("bdzdbbzsSVSgvrDrd"),
                                      ],),
                                      const SizedBox(height: 10,),
                                      Row(children: [
                                        Text("Payment :-",style: TextStyle(fontSize: 19),),
                                        SizedBox(width: 5,),
                                        Text("dddbbrbrdgrr",style: const TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w700,fontSize: 17),),


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
                            );
                          }),
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
