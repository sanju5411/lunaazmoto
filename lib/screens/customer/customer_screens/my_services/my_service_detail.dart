import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service/service.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';

class MyServiceDetail extends StatefulWidget {
  static const String routeName = '/myservice_detail';
  const MyServiceDetail({Key? key}) : super(key: key);

  @override
  State<MyServiceDetail> createState() => _MyServiceDetailState();
}

class _MyServiceDetailState extends State<MyServiceDetail> {
  @override
  Widget build(BuildContext context) {
    final bookingData = ModalRoute.of(context)?.settings.arguments as Service;
    print("<<<<<<<<<<${bookingData}>>>>>>>>>>>>>");
    var bookingId = bookingData.bookingId;

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

            Container(
              //height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50),),
                  color: CustomColor.primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${bookingData.bookingUser?.name}",style: const TextStyle(fontSize: 22,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                        SizedBox(height: 5,),

                        Text("${bookingData.bookedDate}  @ ${bookingData.bookedTime}",style: const TextStyle(fontSize: 17,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),),


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
                              Text("Service Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 26),),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8,),
                                Text("Vehicle Type : ${bookingData.bookingPackage?.packageType} Service",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                                const SizedBox(height: 8,),
                                Text("Vehicle Number- ${bookingData.bookingVehNum}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
                                const SizedBox(height: 8,),
                                Text("${bookingData.bookedDate}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                                const SizedBox(height: 8,),
                                Text("${bookingData.bookedTime}",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Row(
                            children: const [
                              Icon(Icons.person,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text("Customer information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 25),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("Name : ${bookingData.bookingUser?.name}",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 20),),
                                const SizedBox(height: 8,),
                                Text("Phone  :  ${bookingData.bookingUser?.countryCode}-${bookingData.bookingUser?.mobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 20),),
                                const SizedBox(height: 8,),
                                Text("Email : ${bookingData.bookingUser?.email}",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 20),),
                                const SizedBox(height: 8,),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),


                          Row(
                            children: const [
                              Icon(Icons.location_on,color: Colors.grey,),
                              SizedBox(width: 10,),
                              Text("Pick Up Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 25),),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("City : ${bookingData.bookingAddress?.fullAddress}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 18),),
                                SizedBox(height: 8,),

                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),

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




// final myServiceData = ModalRoute.of(context)?.settings.arguments as OnGoingBookings;
// var bookingId = myServiceData.bookingId;
