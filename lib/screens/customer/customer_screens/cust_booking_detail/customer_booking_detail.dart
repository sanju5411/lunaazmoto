import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service/service.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerBookingDetail extends StatefulWidget {
  static const String routeName = '/customer_booking_detail';

  const CustomerBookingDetail({Key? key}) : super(key: key);

  @override
  State<CustomerBookingDetail> createState() => _CustomerBookingDetailState();
}

class _CustomerBookingDetailState extends State<CustomerBookingDetail> {
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Booking Status :-",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w800),),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xfffff1f1),
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${bookingData.bookingStatus}",style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700),),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 22,),
                          const Text("Service Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 23),),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Text("Service Type :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              SizedBox(width: 6,),
                              Text("${bookingData.bookingPackage?.packageType}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Vehicle No. :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              SizedBox(width: 6,),
                              Text("${bookingData.bookingVehNum}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Time :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              SizedBox(width: 6,),
                              Text("${bookingData.bookedDate} - ${bookingData.bookedTime}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                            ],
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: Colors.black54,
                            ),
                          ),


                          const SizedBox(height: 22,),
                          const Text("Customer information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 23),),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Text("Name :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              SizedBox(width: 6,),
                              Text(bookingData.bookingUser?.name != null ?"${bookingData.bookingUser?.name}":"${bookingData.bookingAddress?.name}",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Phone No :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                              SizedBox(width: 6,),
                              Text("${bookingData.bookingUser?.countryCode}-${bookingData.bookingUser?.mobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: Colors.black54,
                            ),
                          ),


                          const SizedBox(height: 22,),
                          const Text("Pick Up Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 24),),
                          const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: AutoSizeText(" ${bookingData.bookingAddress?.fullAddress}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 18),),
                          ),
                          const SizedBox(height: 10,),
                          const Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Divider(
                              color: Colors.black54,
                            ),
                          ),

                          bookingData.bookingCenter != null?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 22,),
                                  Row(
                                    children: [
                                      SizedBox( width: 180,child: const AutoSizeText("Driver Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 23),)),
                                      const Spacer(),
                                      InkWell(
                                        onTap: ()async{
                                          Uri phoneno = Uri.parse('tel:${bookingData!.bookingDriver!.mobile}');
                                          if (await launchUrl(phoneno)) {

                                          }else{

                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Color(0xffffdddd)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.call),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Text("Name :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                                      SizedBox(width: 6,),
                                      Text("${bookingData.bookingDriver?.name}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Phone No :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                                      SizedBox(width: 6,),
                                      Text("${bookingData.bookingDriver?.mobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("Email :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                                      SizedBox(width: 6,),
                                      Text("${bookingData.bookingDriver?.email}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Divider(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ): SizedBox(),


                          bookingData.bookingCenter != null?
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           const SizedBox(height: 24,),
                           Row(
                             children: [
                               const SizedBox(
                                   width: 210,
                                   child: AutoSizeText("Service Center Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 23),)),
                               Spacer(),
                               InkWell(
                                 onTap: ()async{
                                   Uri phoneno = Uri.parse('tel:${bookingData!.bookingCenter!.shopMobile}');
                                   if (await launchUrl(phoneno)) {

                                   }else{

                                   }
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 12),
                                   child: Container(
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(50),
                                         color: Color(0xffffdddd)
                                     ),
                                     child: Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Icon(Icons.call),
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 15,),
                           Row(
                             children: [
                               Text("Owner Name:-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                               SizedBox(width: 6,),
                               Text("${bookingData.bookingCenter?.shopOwner}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                             ],
                           ),
                           SizedBox(height: 10,),
                           Row(
                             children: [
                               Text("Phone No :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                               SizedBox(width: 6,),
                               Text("${bookingData.bookingCenter?.shopMobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                             ],
                           ),
                           SizedBox(height: 10,),
                           Row(
                             children: [
                               Text("Shop Name :-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                               SizedBox(width: 6,),
                               Text("${bookingData.bookingCenter?.shopName}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 17),),
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.only(right: 20),
                             child: Divider(
                               color: Colors.black54,
                             ),
                           ),
                           SizedBox(height: 15,),

                         ],): SizedBox(),

                        ],
                      ),
                    ),),
                ],
              ),
            ),

            // SizedBox(height: 10,),
            //
            // bookingData.bookingCenter != null?
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     width: screenSize.width,
            //     decoration: BoxDecoration(
            //       color: Color(0xffffdddd),
            //       borderRadius: BorderRadius.circular(16)
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(9.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //         SizedBox(height: 15,),
            //           Row(
            //             children: [
            //               Text("Service Center Detail",style: TextStyle(fontSize: 23,),),
            //               Spacer(),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 6,),
            //                 child: Container(
            //                     decoration: BoxDecoration(color: CustomColor.whiteColor,borderRadius: BorderRadius.circular(50)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Icon(Icons.call),
            //                     )),
            //               )
            //             ],
            //           ),
            //           SizedBox(height: 15,),
            //           Row(
            //             children: [
            //               Text("Phone No :-",style: TextStyle(fontSize: 18),),
            //               SizedBox(width: 20,),
            //               Text("${bookingData.bookingCenter?.shopMobile}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17),),
            //             ],
            //           ),
            //           SizedBox(height: 10,),
            //           Row(
            //             children: [
            //               Text("Shop Name :-",style: TextStyle(fontSize: 18),),
            //               SizedBox(width: 20,),
            //               Text("${bookingData.bookingCenter?.shopName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17),),
            //             ],
            //           ),
            //         ],),
            //     ),
            //   ),
            // ): SizedBox(),
            //
            // SizedBox(height: 20,),
            //
            // bookingData.bookingDriver != null?
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     width: screenSize.width,
            //     decoration: BoxDecoration(
            //         color: Color(0xffffdddd),
            //         borderRadius: BorderRadius.circular(16)
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(9.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           SizedBox(height: 15,),
            //           Row(
            //             children: [
            //               Text("Driver Detail",style: TextStyle(fontSize: 23,),),
            //               Spacer(),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 6,),
            //                 child: Container(
            //                     decoration: BoxDecoration(color: CustomColor.whiteColor,borderRadius: BorderRadius.circular(50)),
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Icon(Icons.call),
            //                     )),
            //               )
            //             ],
            //           ),
            //           SizedBox(height: 15,),
            //           Row(
            //             children: [
            //               Text("Phone No :-",style: TextStyle(fontSize: 18),),
            //               SizedBox(width: 20,),
            //               Text("${bookingData.bookingDriver?.mobile}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17),),
            //             ],
            //           ),
            //           SizedBox(height: 10,),
            //           Row(
            //             children: [
            //               Text("Shop Name :-",style: TextStyle(fontSize: 18),),
            //               SizedBox(width: 20,),
            //               Text("${bookingData.bookingDriver?.name}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17),),
            //             ],
            //           ),
            //         ],),
            //     ),
            //   ),
            // ): SizedBox(),
            // SizedBox(height: 20,),
            //

            // SizedBox(height: 20,),




          ],
        ),
      ),
    );
  }
}
