import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lunaaz_moto/common/widgets/custom_booking_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service/service.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/cust_booking_detail/customer_booking_detail.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_service_detail.dart';
import 'package:lunaaz_moto/services/api_service.dart';

import '../../../../common/widgets/choose_vehicle.dart';

class MyServicesScreen extends StatefulWidget {
  static const String routeName = '/my_services_screen';

  const MyServicesScreen({Key? key}) : super(key: key);
  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();

}

class _MyServicesScreenState extends State<MyServicesScreen> {

  bool loading = true;


  List<Service> bookServiceList = [];
  List<Service> onGoingList = [];
  List<Service> lastBookings = [];

    @override
    void initState() {
      super.initState();
      _setBookingFormData();
    }
  Future<void> _onRefresh() async {
    BookingList bookingList = await ApiService.getMyServices();



    if(bookingList.status  == "success"){
      onGoingList = bookingList.onGoingBookings!;
      lastBookings = bookingList.bookings!;
      setState(() {
        loading = false;
      });
    }


  }
   void _setBookingFormData() async {

      BookingList bookingList = await ApiService.getMyServices();



      if(bookingList.status  == "success"){
        onGoingList = bookingList.onGoingBookings!;
        lastBookings = bookingList.bookings!;
        setState(() {
          loading = false;
        });
      }

    }





  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    print(onGoingList.length);

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        appBar:AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("Services History"),
        ),
        body: Container(
          height: screenSize.height,
          decoration: const BoxDecoration(
              color: Color(0xffffe9e2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )
          ),
          child:
              !loading?
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                onGoingList.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            width: screenSize.width * 0.8,
                            child: AutoSizeText(
                              maxLines: 2,
                              "Ongoing Services",style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30
                            ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),

                        ListView.builder(
                        itemCount: onGoingList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {

                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, MyServiceDetail.routeName,arguments: onGoingList[index],);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 16),
                            child: Container(
                              // height: screenSize.height * 0.18,
                              width: screenSize.width,
                              decoration:  BoxDecoration(
                                  color: CustomColor.whiteColor,
                                  boxShadow: const
                                  [
                                    BoxShadow(
                                      color: Color(0xffd7d7d7),
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
                                padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screenSize.width * 0.5,
                                          child: AutoSizeText(

                                           onGoingList[index].bookingVehNum != null?onGoingList[index].bookingVehNum!.toString():"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                                          maxLines: 2,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                color: Color(
                                                    0xfffcd3d3)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(" ${(onGoingList[index].status.toString())}",style: TextStyle(color: CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 17),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    Divider(height: 1,color: Colors.black54,),
                                    const SizedBox(height: 8,),
                                    Row(
                                      children: [
                                      Text("Booking No. -",style: TextStyle(fontSize: 17),),
                                      const SizedBox(width: 7,),
                                      Text(onGoingList[index].bookingNumber.toString(),style: const TextStyle(fontSize: 17),)
                                    ],),
                                    const SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Text("Date :-  ",style: TextStyle(fontSize: 20),),
                                          Text(onGoingList[index].bookingDate.toString()),
                                        ],
                                      ),
                                      const SizedBox(height: 8,),


                                    Row(
                                      children: [
                                        onGoingList[index].bookingVehType == "four_wheeler" ?
                                        Row(children: [
                                          const Text("Service Type :-",style: TextStyle(fontSize: 20),),
                                          const SizedBox(width: 7,),
                                          Text("Car",),
                                        ],):  Row(children: [
                                          const Text("Service Type :-",style: TextStyle(fontSize: 20),),
                                          const SizedBox(width: 7,),
                                          Text("Bike"),
                                        ],),
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    Text("Payment :- ${(onGoingList[index].bookingPaymentStatus.toString())}",style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 8,),
                                    Row(children: [
                                      Text("Vehicle No. -",style: TextStyle(fontSize: 20),),
                                      SizedBox(width: 7,),
                                  SizedBox(
                                    width: screenSize.width * 0.5,
                                    child: AutoSizeText(
                                      maxLines: 2,
                                    "${onGoingList[index].bookingVehName.toString()}",style: const TextStyle(fontSize: 17),),
                                  )


                                    ],),
                                    SizedBox(height: 8,),
                                    Divider(height: 1,color: Colors.black54,),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("View Detail",style: TextStyle(fontSize: 18,color: Colors.cyan,fontWeight: FontWeight.w800),),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                }),
                      ],
                    ),
                  ): SizedBox(height: 15,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 20),
                        child: const Text("Last Services",style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30
                        ),),
                      ),
                      lastBookings.isNotEmpty?
                  ListView.builder(
                      itemCount: lastBookings.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        //print("Last Servies--->${lastBookings[index]}");
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, MyServiceDetail.routeName,arguments: lastBookings[index],);
                            },
                            child: Container(

                              width: screenSize.width,
                              decoration:  BoxDecoration(
                                  color: CustomColor.whiteColor,
                                  boxShadow: const
                                  [
                                    BoxShadow(
                                      color: Color(0xffd7d7d7),
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
                                padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 7,),
                                        Text((lastBookings[index].bookingVehNum.toString()),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                color: Color(
                                                    0xfffcd3d3)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(" ${(lastBookings[index].status.toString())}",style: TextStyle(color: CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 17),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Divider(height: 1,color: Colors.grey,),
                                    const SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Text("Date :-  ",style: TextStyle(fontSize: 20),),
                                        Text(lastBookings[index].bookingDate.toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        lastBookings[index].bookingVehType == "four_wheeler" ?
                                        Row(children: [
                                          const Text("Service Type :-",style: TextStyle(fontSize: 20),),
                                          const SizedBox(width: 7,),
                                          Text("Car",),
                                        ],):  Row(children: [
                                          const Text("Service Type :-",style: TextStyle(fontSize: 20),),
                                          const SizedBox(width: 7,),
                                          Text("Bike"),
                                        ],),
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    Row(children: [
                                      Text("Booking No. -",style: TextStyle(fontSize: 17),),
                                      const SizedBox(width: 7,),
                                      Text(lastBookings[index].bookingNumber.toString(),style: const TextStyle(fontSize: 17),)
                                    ],),
                                    const SizedBox(height: 8,),
                                    Row(children: [
                                      Text("Vehicle Name. -",style: TextStyle(fontSize: 17),),
                                      const SizedBox(width: 7,),
                                      Text(lastBookings[index].bookingVehName.toString(),style: const TextStyle(fontSize: 17),)
                                    ],),
                                    const SizedBox(height: 8,),
                                      Text("Payment :- ${(lastBookings[index].bookingPaymentStatus.toString())}",style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 8,),
                                    Divider(height: 1,color: Colors.grey,),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("View Detail",style: TextStyle(fontSize: 18,color: Colors.cyan,fontWeight: FontWeight.w800),),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }): Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: Container(
                          height: 50,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: CustomColor.whiteColor
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text("No Last Services",style: TextStyle(fontSize: 20),)),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ): SizedBox(
                  height: screenSize.height,
                  child: Center(child: CircularProgressIndicator())),
        )
      ),
    );
  }
}
