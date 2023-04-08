import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/models/service_center/booking_details_main_model.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/CustomerBookingDetail/service_completed.dart';
import 'package:lunaaz_moto/services/api_service.dart';

import '../../../../common/widgets/custom_button.dart';

class CustomerBookingInfo extends StatefulWidget {
  static const String routeName = '/customer_booking_info';

  const CustomerBookingInfo({Key? key}) : super(key: key);

  @override
  State<CustomerBookingInfo> createState() => _CustomerBookingInfoState();
}

class _CustomerBookingInfoState extends State<CustomerBookingInfo> {
  int? _bookingId = 0;
  bool isLoading = false;
  bool isApiCalled = false;
  NewServices? bookingData;
  bool startButtonVisibility = true;
  bool stopButtonVisibility = false;

  changeBookingStatus(String status, int bookingId) async {
    Map<String, String> jsonInput = {
      "status": status,
    };
    BookingList bookingList = await ApiService.changeServiceStatus(
        bookingId: bookingId, jsonInput: jsonEncode(jsonInput));
    print("Change Booking Status--->${jsonEncode(bookingList)}");
    if (bookingList.status == "success") {
      if(status == "service_completed"){
        setState(() {
          Navigator.pushNamed(context, ServiceCenterBookingDone.routeName);
        });
      }
      getBookingDetailsFromApi(bookingId);
      Fluttertoast.showToast(msg: "${bookingList.message}");
    } else if (bookingList.status == null) {}
  }

  getBookingDetailsFromApi(int bookingId) async {
    setState(() {
      isLoading = true;
    });

    BookingDetailsMainModel detailsMainModel =
    await ApiService.getBookingDetailsServiceCenter(
        bookingId: bookingId.toString());
    if (detailsMainModel.status != null) {
      setState(() {
        isApiCalled = true;
        bookingData = detailsMainModel.bookingDetail!;
        // if(bookingData!.bookingStatus == ""){
        //   startButtonVisibility = true;
        //   stopButtonVisibility = true;
        // }
        print("hhhhgggghhhg>>>>${jsonEncode(bookingData)}");
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final _bookingData =
    ModalRoute.of(context)?.settings.arguments as NewServices;
    var bookingId = _bookingData.bookingId;
    print("bkkID>>>>>${bookingId}");

    if (!isApiCalled) {
      getBookingDetailsFromApi(bookingId!);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomColor.whiteColor,
        title: Text(
          "Booking Details",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? SizedBox(
          height: screenSize.height,
          child: const Center(
              child: CircularProgressIndicator(
                color: CustomColor.primaryColor,
              )),
        )
            : Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white, // Your desired background color
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(
                              209, 249, 255, 0.5058823529411764),
                          blurRadius: 10),
                    ]),
                child: InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, CustomerBookingInfo.routeName);
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
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(ApiConfig.baseUrl+bookingData!.bookingUser!.avatar.toString()), // No matter how big it is, it won't overflow
                      ),
                      title: Text("${bookingData?.bookingAddress?.name}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                      subtitle: Text("${bookingData?.bookedDate}, ${bookingData?.bookedTime}\n${bookingData!.bookingAddress?.fullAddress}\n${bookingData?.bookingUser?.email}",
                        style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                      trailing:  Container(
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFE8F0FF)
                          ),
                          child: Text("${_bookingData.status}",style: TextStyle(color: Color(0xFF1D3A70)),))
                  ),
                ),
              ),
            ),
            Container(
              //height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: CustomColor.primaryColor),
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 17),
                    child: Row(
                      children: [
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x54ffffff)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.call,
                              color: CustomColor.whiteColor,
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${bookingData?.bookingAddress?.name}",style: const TextStyle(fontSize: 20,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            if(bookingData?.bookingAddress != null)...[
                              Text("${bookingData?.bookingAddress?.city},${bookingData?.bookingAddress?.state}",style: const TextStyle(fontSize: 13,color: CustomColor.whiteColor,fontWeight: FontWeight.w500),),
                            ],
                            const SizedBox(height: 5,),
                            Text("${bookingData?.bookedDate}  @ ${bookingData?.bookedTime}",style: const TextStyle(fontSize: 17,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),),
                            const SizedBox(height: 5,),
                            Text("Status :${bookingData?.bookingStatus} ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 15,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),),
                          ],),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                        color: CustomColor.whiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Booking Service",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        const SizedBox(height: 8,),
                        Text("Select Type : ${bookingData?.bookingPackage?.packageType} Service",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                        const SizedBox(height: 8,),
                        Text("Service Price : \u20B9 ${bookingData?.bookingPackage?.packagePrice}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                        const SizedBox(height: 8,),
                        Text("Package Feature: ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                        HtmlWidget(
                          (bookingData?.bookingPackage!.packageFeaturesName!.toString()).toString(),
                          textStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),
                        ),
                        const SizedBox(height: 8,),
                        Text("Pick-Up Date :  ${bookingData?.bookedDate}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                        const SizedBox(height: 8,),
                        Text("Pick-Up Time : ${bookingData?.bookedTime}",style: TextStyle(color:CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 15),),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Customer information",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Name : ${bookingData?.bookingAddress!.name}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Phone  :  ${bookingData?.bookingUser!.mobile}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        if(bookingData!.bookingDriver != null)...[
                          Text(
                            "Driver information",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Name : ${bookingData?.bookingDriver!.name}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Phone  :  ${bookingData?.bookingDriver!.mobile}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                        Text(
                          "General Service",
                          style: TextStyle(
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Vehicle Number- ${bookingData?.bookingVehNum}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${bookingData?.bookingAddress!.fullAddress}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Add Live Link",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 19),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () {
                                    //here we add let long
                                  },
                                  child: const Icon(
                                    Icons.video_collection,
                                    color: CustomColor.primaryColor,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(20.0),
                              ),
                              hintStyle:
                              TextStyle(color: Colors.grey),
                              hintText: "Video Url",
                              fillColor: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: startButtonVisibility,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: CustomButton(
                              text: 'Start Service',
                              onTap: () {
                                changeBookingStatus("processed", bookingId!);
                              },
                            ),
                          ),
                        ),
                        Visibility(
                          visible: stopButtonVisibility,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: CustomButton(
                              text: 'Service Completed',
                              onTap: () {
                                changeBookingStatus("service_completed", bookingId!);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
