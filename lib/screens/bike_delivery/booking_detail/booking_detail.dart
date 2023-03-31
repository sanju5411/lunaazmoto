import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lunaaz_moto/configs/api_config.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service_booking_list/service_booking_list_model.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/models/service_center/booking_details_main_model.dart';
import 'package:lunaaz_moto/models/service_center/service_center_list_main_model.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/services/api_service.dart';
class BookingDetail extends StatefulWidget {
  static const String routeName = '/booking_detail';
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {

  bool showServiceCenter = false;
  bool showAcceptRejectButton = true;
  int? serviceCenterId = 0;
  List<ServiceCenters>? serviceCenters;
  int? _bookingId = 0;
  bool isLoading = true;
  bool isgettingProfile = true;
  NewServices? bookingData;
  bool dropedShowView = false;
  bool pickFromVendorShowView = false;
  bool dropToCustomer = false;


  changeBookingStatus(String status, int bookingId) async{
    Map<String, String> jsonInput = {
      "status" : status,
    };
    BookingList bookingList = await ApiService.changeServiceStatus(bookingId : bookingId,jsonInput: jsonEncode(jsonInput));
    print("Change Booking Status--->${jsonEncode(bookingList)}");
    if(bookingList.status != null){
      setState(() {
        showServiceCenter = true;
        showAcceptRejectButton = false;
        _bookingId = bookingId;
      });
      Fluttertoast.showToast(msg: "${bookingList.message}");
    }else if(bookingList.status == null){

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServiceCenterListFromApi();
  }

  getServiceCenterListFromApi() async{
    ServiceCenterListMainModel serviceCenterListMainModel = await ApiService.getServiceCenter();
    if(serviceCenterListMainModel.status != null){
      serviceCenters = serviceCenterListMainModel.serviceCenters;
      setState(() {
        isLoading = false;
      });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }

  assingServiceCenterForService(var _bookingIdData) async{
    Map<String, String> jsonInput = {
      "center_id" : serviceCenterId.toString(),
    };
    ServiceCenterListMainModel mainModel = await ApiService.assingServiceCenter(bookingId: _bookingIdData, jsonInput: jsonEncode(jsonInput));
    print("main Model --->${jsonEncode(mainModel)}");
    if(mainModel.status != null){
      Fluttertoast.showToast(msg: "${mainModel.message}");
      getBookingDetailsFromApi(_bookingIdData!);
      setState(() {
        showServiceCenter = false;
      });
    }
  }

  getBookingDetailsFromApi(int bookingId) async{
    print(bookingId);
    setState(() {
      isgettingProfile = true;
    });
    BookingDetailsMainModel detailsMainModel = await ApiService.getBookingDetails(bookingId: bookingId.toString());
    if(detailsMainModel.status != null){
      setState(() {
        isgettingProfile = false;
        bookingData = detailsMainModel.bookingDetail!;
        print("hhhhgggghhhg>>>>${bookingData?.bookingStatus}");
        if(bookingData?.bookingStatus == "accepted"){
          showAcceptRejectButton = false;
          if(bookingData?.bookingCenter != null){
            showServiceCenter = false;
            dropedShowView = true;
            pickFromVendorShowView = false;
            dropToCustomer = false;
          }else{
            showServiceCenter = true;
            dropedShowView = false;
            pickFromVendorShowView = false;
            dropToCustomer = false;
          }
        }else if(bookingData?.bookingStatus == "picked"){
          setState(() {
            showAcceptRejectButton = false;
            dropedShowView = true;
            showServiceCenter = false;
            pickFromVendorShowView = false;
            dropToCustomer = false;
          });
        }
        else if(bookingData?.bookingStatus == "dropped_at_vendor"){
          setState(() {
            showAcceptRejectButton = false;

            dropedShowView = false;
            showServiceCenter = false;
            pickFromVendorShowView = false;
            dropToCustomer = false;
          });
        }else if(bookingData?.bookingStatus == "service_completed"){
          setState(() {
            showAcceptRejectButton = false;
            dropedShowView = false;
            showServiceCenter = false;
            pickFromVendorShowView = true;
            dropToCustomer = false;
          });
        }else if(bookingData?.bookingStatus == "picked_at_vendor"){
          setState(() {
            showAcceptRejectButton = false;
            dropedShowView = false;
            showServiceCenter = false;
            pickFromVendorShowView = false;
            dropToCustomer = true;
          });
        }

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final _bookingData = ModalRoute.of(context)?.settings.arguments as NewServices;
    var bookingId = _bookingData.bookingId;
    print("bkkID>>>>>${_bookingId}");

    if(isgettingProfile){
      getBookingDetailsFromApi(bookingId!);
    }

    print("BookingDetailState===>${jsonEncode(_bookingData)}");
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
        child: isLoading ? Container(
          height: screenSize.height,
          child: Center(child: CircularProgressIndicator()),
        ): Column(
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
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(ApiConfig.baseUrl+bookingData!.bookingUser!.avatar.toString()), // No matter how big it is, it won't overflow
                      ),
                      title: Text("${bookingData?.bookingUser?.name}",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                      subtitle: Text("${bookingData?.bookedDate}, ${bookingData?.bookedTime}\n${bookingData!.bookingAddress!.fullAddress}\n${bookingData?.bookingUser?.email}",
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
                            Text("${bookingData?.bookingUser?.name}",style: const TextStyle(fontSize: 20,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
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
                          ],)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: const BoxDecoration(
                        color: CustomColor.whiteColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              children: const [
                                Icon(Icons.watch_later,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Booking Service",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 35),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Row(
                              children: const [
                                Icon(Icons.person,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Customer information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("Name : ${bookingData?.bookingUser?.name}",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                const SizedBox(height: 8,),
                                Text("Phone  :  ${bookingData?.bookingUser?.countryCode}-${bookingData?.bookingUser?.mobile}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 35),
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("General Service",style: TextStyle(color: CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 20),),
                                SizedBox(height: 8,),
                                Text("Vehicle Number- ${bookingData?.bookingVehNum}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              children: const [
                                Icon(Icons.location_on,color: Colors.grey,),
                                SizedBox(width: 10,),
                                Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            margin: EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(bookingData?.bookingAddress != null)...[
                                  Text("${bookingData?.bookingAddress?.fullAddress}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                  // SizedBox(height: 8,),
                                  // Text("City : ${bookingData?.bookingAddress?.city}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                  // SizedBox(height: 8,),
                                  // Text("Area : ${bookingData?.bookingAddress?.state}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                                ],

                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Visibility(
                            visible: showAcceptRejectButton,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    changeBookingStatus("accepted",bookingId!);
                                  },
                                  child: Container(
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
                                ),
                                const SizedBox(width: 50,),
                                GestureDetector(
                                  onTap: (){
                                    changeBookingStatus("rejected",bookingId!);
                                  },
                                  child: Container(
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
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: showServiceCenter,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              height: 60.0,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: DropdownSearch<dynamic>(
                                mode: Mode.BOTTOM_SHEET,
                                showSearchBox: serviceCenters!.length > 10 ? true : false,
                                validator: (value) {
                                  if (value == null) {
                                    return "Required field";
                                  }
                                },
                                items: serviceCenters?.map((e)=>e.shopName).toList(),
                                dropdownSearchDecoration: const InputDecoration(labelText: "Select Service Center "),
                                onChanged: (value){
                                  serviceCenterId = serviceCenters?.singleWhere((e)=>e.shopName==value).shopId;
                                  print("serviceCenterId--->$serviceCenterId");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Visibility(
                            visible: showServiceCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    assingServiceCenterForService(bookingId);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: CustomColor.primaryColor,
                                        border: Border.all(
                                          color: CustomColor.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    height: 40,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [

                                          Text("Submit",style: TextStyle(color: Color(0xFFFFFFFF)),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 50,),
                                GestureDetector(
                                  onTap: (){
                                    changeBookingStatus("picked",bookingId!);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: CustomColor.whiteColor,
                                        border: Border.all(
                                          color: CustomColor.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),

                                    height: 40,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text("Pickup",style: TextStyle(color: CustomColor.primaryColor),)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: dropedShowView,
                            child: GestureDetector(
                              onTap: (){
                                changeBookingStatus("dropped_at_vendor",bookingId!);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                    color: CustomColor.whiteColor,
                                    border: Border.all(
                                      color: CustomColor.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Drop",style: TextStyle(color: CustomColor.primaryColor),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: pickFromVendorShowView,
                            child: GestureDetector(
                              onTap: (){
                                changeBookingStatus("picked_at_vendor",bookingId!);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                    color: CustomColor.whiteColor,
                                    border: Border.all(
                                      color: CustomColor.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Picked From Vendor",style: TextStyle(color: CustomColor.primaryColor),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: dropToCustomer,
                            child: GestureDetector(
                              onTap: (){
                                changeBookingStatus("completed",bookingId!);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                    color: CustomColor.whiteColor,
                                    border: Border.all(
                                      color: CustomColor.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Drop To Customer",style: TextStyle(color: CustomColor.primaryColor),)
                                    ],
                                  ),
                                ),
                              ),
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
