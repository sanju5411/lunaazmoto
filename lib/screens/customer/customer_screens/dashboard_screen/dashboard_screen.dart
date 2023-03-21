import 'dart:convert';
import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/choose_vehicle.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/common/widgets/custom_last_services.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/banner/banner_image.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
import 'package:lunaaz_moto/models/customer/happy_customer/happy_customer.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_services.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/side_navbar/side_navbar.dart';
import 'package:lunaaz_moto/services/api_service.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard_screen';


  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool loading = true;

  Dashboard? _dashboard;
  List<HappyCustomer> _happyCustomers = [];
  List<BannerImage> _banners = [];
  List<Widget> bannerSliders = [];
  int? todayBookingCount = 0;
  int? totalBookingCount = 0;
  List<dynamic> lastServices = [];
  List<ServiceModel> serviceModel = [];


  _getDashboardData() async {

    setState(() {
      loading = true;
    });


    Dashboard dashboard = await ApiService.dashboard("customers");


    if (mounted) {
      setState(() {
        _dashboard = dashboard;
        if (_dashboard!.happyCustomers != null &&
            _dashboard!.happyCustomers!.isNotEmpty) {
          _happyCustomers = _dashboard!.happyCustomers!;
        }
        if (_dashboard!.banners != null && _dashboard!.banners!.isNotEmpty) {
          _banners = _dashboard!.banners!;
        }
        if (_dashboard!.serviceModel != null &&
            _dashboard!.serviceModel!.isNotEmpty) {
          lastServices = _dashboard!.serviceModel!;
          serviceModel = _dashboard!.serviceModel!;
          print("last service>>>>>>>>>${jsonEncode(serviceModel[0].bookingCenter)}<<<<<<<<<<<");

        }
       todayBookingCount = _dashboard!.todayBookings!;
       totalBookingCount = _dashboard!.totalBookings!;
        setState(() {
          loading = false;
        });
      });
    }
    // _createSlider();
    _createBannerSlider();
  }

  @override
  void initState() {

    _getDashboardData();

    super.initState();
    //  WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: CustomColor.whiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
        title: Text("Lunaaz Moto",style: TextStyle(color: CustomColor.whiteColor),
        ),
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
      drawer: Drawer(
        child:NavCusDrawer()
      ),
      body: !loading ?
      StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenSize.width,
                decoration:const  BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),),
                child: bannerSliders.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 2.2,
                      viewportFraction: 0.8,
                      scrollDirection:
                      Axis.horizontal,
                      autoPlayInterval:
                      const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                      const Duration(
                          milliseconds: 500),
                  ),
                  items: bannerSliders,
                ),
                    )
                    : const SizedBox(),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding:  EdgeInsets.only(left: 20,top: 20,bottom: 10),
                child: Text("Happy clients",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),),
              const SizedBox(height: 10,),
              _happyCustomers.isNotEmpty
                  ? Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: screenSize.width,
                    child: ListView.builder(
                      padding: const EdgeInsets
                          .symmetric(
                          horizontal: 10),
                      shrinkWrap: true,
                      scrollDirection:
                      Axis.horizontal,
                      itemCount:
                      _happyCustomers.length,
                      itemBuilder:
                          (BuildContext context,
                          index) {
                        print("Customer Name :- ${_happyCustomers[index].name}");
                        return Padding(
                          padding:
                          const EdgeInsets
                              .all(5.0),
                          child: SizedBox(
                            width: 100,
                            height: 110,
                            child: Column(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration:
                                  BoxDecoration(
                                    color: Colors
                                        .white,
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        34),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors
                                            .black38,
                                        blurRadius:
                                        2,
                                        spreadRadius:
                                        1,
                                      )
                                    ],
                                  ),
                                  child:
                                  ClipRRect(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        34),
                                    child: _happyCustomers[index].avatar !=
                                        null &&
                                        _happyCustomers[index]
                                            .avatar!
                                            .isNotEmpty
                                        ? Image
                                        .network(
                                      '${ApiConfig.baseUrl}${_happyCustomers[index].avatar}',
                                      fit: BoxFit
                                          .cover,
                                    )
                                        : Image
                                        .asset(
                                      "assets/images/user_profile.png",
                                      fit: BoxFit
                                          .cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text((_happyCustomers[index].name == "") ?  "Unknown".toUpperCase() : _happyCustomers[index].name.toString().toUpperCase(),
                                  maxLines: 2,
                                  textAlign:
                                  TextAlign
                                      .center,
                                  style: const TextStyle(
                                      fontSize:
                                      12,
                                      fontWeight:
                                      FontWeight
                                          .w700),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
                  : SizedBox(),
              const SizedBox(height: 15,),
              Container(
                decoration: const  BoxDecoration(
                    color: Color(0xffffe9e2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),topRight:  Radius.circular(20),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            height:screenSize.height * 0.2,
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [

                                  Color(0xffEC5FA3),
                                  Color(0xffD72F81),

                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Total Service",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                SizedBox(height: 10,),
                                CircleAvatar(
                                  backgroundColor: CustomColor.whiteColor,
                                  child: Text(totalBookingCount.toString(),style: TextStyle(color: Color(0xffD72F81),fontSize: 18,fontWeight: FontWeight.w600),),
                                )
                              ],),
                          ), //total service
                          Spacer(),
                          Container(
                            height:screenSize.height * 0.2,
                            width: screenSize.width * 0.4,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xffDA8334),
                                  Color(0xffCF8849),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Today Service",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                                SizedBox(height: 10,),
                                CircleAvatar(
                                  backgroundColor: CustomColor.whiteColor,
                                  child: Text(todayBookingCount.toString(),style: TextStyle(color: Color(0xffCF8849),fontSize: 18,fontWeight: FontWeight.w600),),
                                )
                              ],),
                          ), //today service
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        textWidget: const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text('Book Now', style: TextStyle(fontSize: 20,color: CustomColor.whiteColor),),
                        ),
                        variant: Variant.booknowbtn,
                        onTap: () {
                          showDialog(context: context, builder: (context) => CustomWheelerPopUp(),);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(),
                          ),
                          );
                        },

                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
                          child: Text("Last Services",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
                        ),

                        const Spacer(),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                  onTap: () => Navigator.pushNamed(context, MyServicesScreen.routeName),
                                  child: Text("View all > ",style: TextStyle(color: CustomColor.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),))),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    serviceModel.isNotEmpty ?
                    SizedBox(
                      width: screenSize.width,
                      height: 570,
                      child: ListView.builder(
                          itemCount: serviceModel.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            print("Last Servies--->${jsonEncode(serviceModel[index].bookingCenter)}");
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                              child: Container(
                                //height: screenSize.height * 0.18,
                                width: screenSize.width,
                                decoration:  BoxDecoration(
                                    color: CustomColor.whiteColor,
                                    boxShadow: const
                                    [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const SizedBox(height: 10,),
                                              Text(serviceModel[index].bookingCenter != null ?
                                              serviceModel[index].bookingCenter!.shopName.toString():"",
                                                style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                              const SizedBox(height: 3,),
                                              Row(children: [
                                                const Text("Booking ID -"),
                                                const SizedBox(width: 7,),
                                                Text(lastServices[index].bookingId.toString())
                                              ],)
                                            ],
                                          ),
                                          Spacer(),
                                          Text(lastServices[index].bookingDate.toString()),
                                        ],
                                      ),
                                      SizedBox(height: 35,),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text("General Service",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: CustomColor.primaryColor),),
                                              SizedBox(height: 3,),
                                              Row(children: [
                                                Text("Vehicle No. -"),
                                                SizedBox(width: 7,),
                                                Text((lastServices[index].bookingVehNum.toString()),),
                                              ],)
                                            ],
                                          ),
                                          Spacer(),
                                          Text((lastServices[index].bookingPaymentStatus.toString()),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ) : SizedBox(),


                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(

                        decoration:  BoxDecoration(
                            color: CustomColor.whiteColor,
                            boxShadow: const
                            [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:   Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Having Problems ?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: CustomColor.primaryColor),),
                                    SizedBox(height: 3,),
                                    Text("Let us help you out !",style: TextStyle(fontSize: 15,color:Colors.grey, fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                  decoration: BoxDecoration(
                                    color: CustomColor.primaryColor,
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(Icons.arrow_forward_outlined,color: CustomColor.whiteColor,),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ) : Center(child: CircularProgressIndicator())

    );
  }

  _createBannerSlider() {
    bannerSliders = _banners
        .map(
          (item) => InkWell(
          child:ClipRRect(
            child: Image.network('${ApiConfig.baseUrl}${item.image}',fit: BoxFit.fill,),
            borderRadius: BorderRadius.circular(20),
          )

      ),
    )
        .toList();
  }
}
//
// body: Container(
// height: screenSize.height,
// width: screenSize.width,
// decoration: const  BoxDecoration(
// color: CustomColor.whiteColor,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10),
// topRight: Radius.circular(10),
// )
// ),
// child: Column(),
// ),


