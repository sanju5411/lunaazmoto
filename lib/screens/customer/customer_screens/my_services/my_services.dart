import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_booking_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/services/api_service.dart';

class MyServicesScreen extends StatefulWidget {
  static const String routeName = '/my_services_screen';

  const MyServicesScreen({Key? key}) : super(key: key);
  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();

}

class _MyServicesScreenState extends State<MyServicesScreen> {

  bool loading = true;


  List<BookingList> bookServiceList = [];
  List<OnGoingBookings> onGoingList = [];
  List<Bookings> lastBookings = [];

    @override
    void initState() {
      super.initState();
      _setBookingFormData();
    }

    void _setBookingFormData() async {

      BookingList bookingList = await ApiService.getMyServices();
      print("booking form data>>>>>${jsonEncode(bookingList)}>>>>");


      if(bookingList.status  == "success"){
        onGoingList = bookingList!.onGoingBookings!;
        lastBookings = bookingList!.bookings!;
        setState(() {
          loading = false;
        });
      }

    }





  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    print(onGoingList.length);

    return Scaffold(
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
        title: Text("My Services"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: CustomColor.whiteColor,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: const Text("Ongoing Services",style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30
                            ),),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BookingForm(),),);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(30)

                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("New Booking",style:
                                TextStyle(color: CustomColor.whiteColor),
                                ),
                              ),
                            ),
                          ),
                        ],),
                      ListView.builder(
                      itemCount: onGoingList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 16),
                        child: Container(
                          // height: screenSize.height * 0.18,
                          width: screenSize.width,
                          decoration:  BoxDecoration(
                              color: CustomColor.whiteColor,
                              boxShadow: const
                              [
                                BoxShadow(
                                  color: Color(0xffffd8d8),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [

                                        //Text(onGoingList[index].bookingCenter != null?onGoingList[index].bookingCenter!.shopName.toString():"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                        const SizedBox(height: 3,),
                                        Row(children: [
                                          const Text("Booking ID -",style: TextStyle(fontSize: 18),),
                                          const SizedBox(width: 7,),
                                          Text(onGoingList[index].bookingId.toString(),style: TextStyle(fontSize: 20),)
                                        ],)
                                      ],
                                    ),
                                    Spacer(),
                                    Text(onGoingList[index].bookingDate.toString()),
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
                                          Text("Vehicle No. -",style: TextStyle(fontSize: 20),),
                                          SizedBox(width: 7,),
                                          Text((onGoingList[index].bookingVehNum.toString()),),
                                        ],)
                                      ],
                                    ),
                                    Spacer(),
                                    Text((onGoingList[index].bookingPaymentStatus.toString()),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600,fontSize: 20),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
              }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Last Services",style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30
                      ),),
                  ListView.builder(
                      itemCount: lastBookings.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        print("Last Servies--->${lastBookings[index]}");
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 16),
                          child: Container(
                            // height: screenSize.height * 0.18,
                            width: screenSize.width,
                            decoration:  BoxDecoration(
                                color: CustomColor.whiteColor,
                                boxShadow: const
                                [
                                  BoxShadow(
                                    color: Color(0xffffd8d8),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const SizedBox(height: 10,),
                                          Text( lastBookings[index].bookingCenter != null? lastBookings[index].bookingCenter!.shopName.toString():"",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                          const SizedBox(height: 3,),
                                          Row(children: [
                                            const Text("Booking ID -"),
                                            const SizedBox(width: 7,),
                                            Text(lastBookings[index].bookingId != null ? lastBookings[index].bookingId.toString():"")
                                          ],)
                                        ],
                                      ),
                                      Spacer(),
                                      Text(lastBookings![index].bookingDate == null ? "": lastBookings![index].bookingDate.toString()),
                                    ],
                                  ),
                                  SizedBox(height: 26,),
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
                                            Text((lastBookings[index].bookingVehNum.toString()),),
                                          ],)
                                        ],
                                      ),
                                      Spacer(),
                                      Text((lastBookings[index].bookingPaymentStatus.toString()),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ): SizedBox(
                height: screenSize.height,
                child: Center(child: CircularProgressIndicator())),
      )
    );
  }
}
