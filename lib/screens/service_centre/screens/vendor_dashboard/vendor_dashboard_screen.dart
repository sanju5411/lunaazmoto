import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/customer_list/customer_common_list.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/navVendorBar/vendor_nav_bar.dart';
import 'package:lunaaz_moto/services/api_service.dart';

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
          title: Column(children: [
            SizedBox(height: 5,),
            Text("Current Location",style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            Text("Sardarpura"),

          ],),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),

              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dpp.jpg"),
              ),
            ),
            SizedBox(width: 15,)
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
                        padding: const EdgeInsets.all(8.0),
                        child:Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "New Services",),),);
                                    // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30),
                                    child: Container(
                                        height: 90,
                                        width: 140,
                                        decoration:  BoxDecoration(
                                            border: Border.all(color: const Color(0xFFA5D872)),
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
                                ),
                                SizedBox(width: 30,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "Today IN Progress",),),);
                                    // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30),
                                    child: Container(
                                        height: 90,
                                        width: 140,
                                        decoration:  BoxDecoration(
                                            border: Border.all(color: const Color(0xFFFF623A)),
                                            borderRadius: const BorderRadius.all(Radius.circular(16))
                                        ),
                                        child:  Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text("Today\nIN Progress",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                            ))

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                                left: 40,

                                child: Container(
                                  height: 50,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xff712AFD)
                                  ),
                                  child: Center(child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),)),),
                            ),
                            Positioned(
                              top: 0,
                              right: 75,

                              child: Container(
                                height: 50,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Color(0xffFF623A)
                                ),
                                child: Center(child: Text("8",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),)),),
                            ),
                          ],
                        )
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "Today Complete",),),);
                                      // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 30),
                                      child: Container(
                                          height: 90,
                                          width: 140,
                                          decoration:  BoxDecoration(
                                              border: Border.all(color: const Color(0xFFA5D872)),
                                              borderRadius: const BorderRadius.all(Radius.circular(16))
                                          ),
                                          child:  Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Today\nComplete",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                              ))

                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerCommonList( appBartext: "Today Rejected",),),);
                                      // Navigator.pushNamed(context, CustomerCommonList.routeName, arguments: Text("gggg"));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 30),
                                      child: Container(
                                          height: 90,
                                          width: 140,
                                          decoration:  BoxDecoration(
                                              border: Border.all(color: const Color(0xFFFF2121)),
                                              borderRadius: const BorderRadius.all(Radius.circular(16))
                                          ),
                                          child:  Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Today\nRejected",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                                              ))

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                left: 40,

                                child: Container(
                                  height: 50,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xff31BE40)
                                  ),
                                  child: Center(child: Text("45",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),)),),
                              ),
                              Positioned(
                                top: 0,
                                right: 75,

                                child: Container(
                                  height: 50,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xffFF2121)
                                  ),
                                  child: Center(child: Text("8",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),)),),
                              ),
                            ],
                          )
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
                                  title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                                  subtitle: const Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
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
