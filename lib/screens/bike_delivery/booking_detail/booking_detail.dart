import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
class BookingDetail extends StatefulWidget {
  static const String routeName = '/booking_detail';
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {



  @override
  Widget build(BuildContext context) {
    final bookingData = ModalRoute.of(context)?.settings.arguments as NewServices;

    print("BookingDetailState===>${jsonEncode(bookingData)}");
    Size screenSize = MediaQuery.of(context).size;


    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined,color: Colors.black,),
        ),
        backgroundColor: CustomColor.whiteColor,
        title: Text("Booking Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Color.fromRGBO(
                          209, 255, 255, 0.5058823529411764), blurRadius: 10),
                    ]
                ),
                child:  InkWell(
                  onTap: (){
                    // Navigator.pushNamed(context, CustomerBookingInfo.routeName);
                  },
                  child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage("https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"), // No matter how big it is, it won't overflow
                      ),
                      title: Text("${bookingData.bookingUser?.name}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                      subtitle: Text("${bookingData.bookedDate}, ${bookingData.bookedTime}\nNewyork, United States\n${bookingData.bookingUser?.email}",
                        style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                      trailing:  Container(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFE8F0FF)
                          ),
                          child: const Text("New Booking",style: TextStyle(color: Color(0xFF1D3A70)),))
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Container(
              //height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50),),
                  color: CustomColor.primaryColor
              ),
              child: Column(
                children: [
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 17),
                    child: Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0x54ffffff)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.call,color: CustomColor.whiteColor,),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${bookingData.bookingUser?.name}",style: const TextStyle(fontSize: 20,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text("Newyork, United States",style: const TextStyle(fontSize: 13,color: CustomColor.whiteColor,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("${bookingData.bookedDate}  @ ${bookingData.bookedTime}",style: const TextStyle(fontSize: 17,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),),


                          ],)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                        color: CustomColor.whiteColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25,),
                          Row(
                            children: const [
                              Icon(Icons.watch_later,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text("Booking Service",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8,),
                                Text("Select Type : ${bookingData.bookingPackage?.packageType} Service",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                const SizedBox(height: 8,),
                                Text("${bookingData.bookedDate}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                const SizedBox(height: 8,),
                                Text("${bookingData.bookedTime}",style: TextStyle(color:CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Row(
                            children: const [
                              Icon(Icons.person,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text("Customer information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("Name : ${bookingData.bookingUser?.name}",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                const SizedBox(height: 8,),
                                Text("Phone  :  ${bookingData.bookingUser?.countryCode}-${bookingData.bookingUser?.mobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("General Service",style: TextStyle(color: CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 20),),
                                SizedBox(height: 8,),
                                Text("Vehicle Number- ${bookingData.bookingVehNum}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Row(
                            children: const [
                              Icon(Icons.location_on,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City : Jodhpur",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                SizedBox(height: 8,),
                                Text("Area : Sardarpura",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Container(
                                color: const Color.fromRGBO(96, 177, 14, 0.15),
                                height: 40,
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.check_circle_outline_outlined,color: Color(0xFF60B10E),),
                                      const SizedBox(width: 5,),
                                      Text("Accept",style: TextStyle(color: Color(0xFF60B10E)),)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 50,),
                              Container(
                                color: const Color(0xFFFFE0E0),
                                height: 40,
                                width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.cancel_outlined,color: Color(0xFFFF2121),),
                                      const SizedBox(width: 5,),
                                      Text("Reject",style: TextStyle(color: Color(0xFFFF2121)),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,)

                        ],
                      ),
                    ),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
