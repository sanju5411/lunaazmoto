import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_plan_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/services/api_service.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}



class _BookingScreenState extends State<BookingScreen> {
  bool loading = true;

  BookingPackage? _bookingPackage;
  int _packageId = 0;
  String _packageName = "";

  List basicPlanColor = [

    Color(0xff006665),
    Color(0xff3FC5AD),
    Color(0xff107E77),

  ];
  List goldPlanColor = [

    Color(0xffFB5A7C),
    Color(0xffFE6585),
    Color(0xffFE184A),

  ];
  List platinumPlanColor = [

    Color(0xffababab),
    Color(0xffbfbfbf),
    Color(0xff8e8e8e),

  ];


  List<dynamic> packageList = [];

  _getPackagesData() async {

    BookingPackage bookingPackage = await ApiService.packages(jsonInput: Object());
    print("booking packeges><><><><<${jsonEncode(_bookingPackage)}");

    if (mounted) {
      setState(() {
        _bookingPackage = bookingPackage;
        print("_bookingPackage>>>>>>>${_bookingPackage}>>>>>>>>");
        if (_bookingPackage!.packageName != null &&
            _bookingPackage!.packageName != _packageName) {
          _packageName = _bookingPackage!.packageName!;
        }

        loading = false;
      });
    }

  }


  @override
  void initState() {

    _getPackagesData();
    super.initState();
    //  WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: CustomColor.whiteColor,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      const Text("Online Bike, Car",style: TextStyle(fontSize: 30,color: CustomColor.whiteColor),),
                      const SizedBox(height: 10,),
                      const Text("Service Booking",style: TextStyle(fontSize: 35,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                      const SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  //here we add let long
                                },
                                child: Icon(Icons.location_on,color: CustomColor.primaryColor,)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Current Location",
                            fillColor: Colors.white),
                      )
                    ],),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: CustomColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: 10,),
                      Text("Select your Package",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                      SizedBox(height: 20,),
                      _bookingPackage != null ?
                      SizedBox(
                        width:screenSize.width,
                        height: 530,
                        child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (BuildContext context,int index){
                              return
                                Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xffFB5A7C),
                                        Color(0xffFE6585),
                                        Color(0xffFE184A),

                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:  Text(_bookingPackage!.packageName.toString(),style: TextStyle(fontSize: 15,color: CustomColor.whiteColor),),
                                      ),
                                      const SizedBox(height: 5,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text("Gold",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: CustomColor.whiteColor),),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        height: 10,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.bottomRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                              Color(0xffFB5A7C),
                                              Color(0xffFE6585),
                                              Color(0xffFE184A),

                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children: [
                                          Row(children: [
                                            Text("Rs.700/-",style: TextStyle(
                                                color: CustomColor.whiteColor,
                                                fontSize: 20,
                                                decoration: TextDecoration.lineThrough
                                            ),),
                                            SizedBox(width: 17,),
                                            Text("Rs.650/-",style: TextStyle(
                                                color: CustomColor.whiteColor,
                                                fontSize: 28,
                                                fontWeight: FontWeight.w700
                                            ),),
                                          ],),
                                          SizedBox(height: 30,),
                                          Row(children: [
                                            Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                                            SizedBox(width: 20,),
                                            Text("Service",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                                          ],),
                                          SizedBox(height: 10,),
                                          Row(children: [
                                            Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                                            SizedBox(width: 20,),
                                            Text("Washings",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                                          ],),
                                          SizedBox(height: 10,),
                                          Row(children: [
                                            Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                                            SizedBox(width: 20,),
                                            Text("Oiling",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                                          ],),
                                          SizedBox(height: 10,),
                                          Row(children: [
                                            Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                                            SizedBox(width: 20,),
                                            Text("Polising",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                                          ],),
                                          SizedBox(height: 10,),
                                          Row(children: [
                                            Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                                            SizedBox(width: 20,),
                                            Text("check all particals",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                                          ],),
                                        ],),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ) : SizedBox(),
                  ],
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
