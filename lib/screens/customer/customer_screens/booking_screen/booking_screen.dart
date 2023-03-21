import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lunaaz_moto/common/widgets/custom_plan_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_model.dart';
import 'package:lunaaz_moto/models/customer/service_model/service_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/services/api_service.dart';

import '../../../../models/customer/service_model/package_model/package_main_model.dart';

class BookingScreen extends StatefulWidget {

  static const String routeName = '/booking_packages';
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  PackagesMainModel? _bookingPackage;
  List<BookingPackage>? _packages;
  // List<PackageBenefits>? packageBenefits;
  bool loading = true;
  String? _currentAddress;
  Position? _currentPosition;



  String rupees = "₹";


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getAllPackagesList();
  }

  getAllPackagesList() async{
    Map<String, String> jsonInput = {
      'package_type': "four_wheeler",
    };
    PackagesMainModel packagesModel = await ApiService.packages(jsonInput: jsonEncode(jsonInput));
    print("packages?>>>>${jsonEncode(packagesModel)}>>>>>>");

      _bookingPackage = packagesModel;
      if(_bookingPackage?.packages != null){
        _packages = _bookingPackage?.packages!;
        setState(() {
          loading = false;
        });

      }

  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: CustomColor.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
         mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                     Text(
                      "Online Bike, Car",
                      style: TextStyle(
                          fontSize: 30, color: CustomColor.whiteColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Service Booking",
                      style: TextStyle(
                          fontSize: 35,
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: ()
                              {
                                _getCurrentPosition();
                              },
                              child: const Icon(
                                Icons.my_location,
                                color: CustomColor.primaryColor,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Current Location",
                          fillColor: Colors.white),
                      readOnly: true,
                    )
                  ],
                ),
              ),
            ),
            Text(_currentAddress ?? ""),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: screenSize.width,
                //height: screenSize.height,
                decoration: const BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Select your Package",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      !loading?
                      SizedBox(
                        width: screenSize.width,
                        height: screenSize.height * 0.45,
                        child: ListView.builder(
                            itemCount: _packages?.length,
                            //physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {

                              return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, BookingForm.routeName);
                                },
                                child: Padding(
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
                                          child: const Text("LunaazMoto",style: TextStyle(fontSize: 15,color: CustomColor.whiteColor),),
                                        ),

                                        const SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:  Text((_packages![index].packageName == null)? "": _packages![index].packageName!,style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: CustomColor.whiteColor),),
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
                                            Row(
                                              children: [
                                              // Text("₹ 1000" ,style: TextStyle(
                                              //     color: CustomColor.whiteColor,
                                              //     fontSize: 20,
                                              //     decoration: TextDecoration.lineThrough
                                              // ),),
                                              SizedBox(width: 17,),
                                              Text("₹ ${_packages![index].packagePrice??"0"}",style: TextStyle(
                                                  color: CustomColor.whiteColor,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w700
                                              ),),
                                            ],),
                                            SizedBox(height: 30,),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                  child: HtmlWidget(
                                                    _packages![index].packageFeaturesName!.toString(),
                                                    textStyle: TextStyle(color: Colors.white),
                                                  ),
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                          ],),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ) : Center(
                          child: CircularProgressIndicator(color: Colors.black,),) ,
                      // : SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
