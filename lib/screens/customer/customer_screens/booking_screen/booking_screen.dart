import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lunaaz_moto/common/widgets/custom_plan_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/packages/package.dart';
import 'package:lunaaz_moto/models/customer/service_model/package_model/package_color_model.dart';
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
  List<Package>? _packages;
  List<PackageColor>? _packageColor;

  // List<PackageBenefits>? packageBenefits;
  bool loading = true;
  String? _currentAddress;
  Position? _currentPosition;

  TextEditingController _pLocation = TextEditingController();

  String rupees = "₹";
  bool isPackage = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _pLocation.text = "";
  }

  getAllPackagesList(String appBarTitle) async {
    Map<String, String> jsonInput = {
      'package_type': appBarTitle,
    };
    PackagesMainModel packagesMainModel =
        await ApiService.packages(jsonInput: jsonEncode(jsonInput));
    print("packages?>>>>${jsonEncode(packagesMainModel)}>>>>>>");

    _bookingPackage = packagesMainModel;
    if (_bookingPackage?.packages != null) {
      _packages = _bookingPackage?.packages!;
      //_packageColor = _bookingPackage?.packageColor!;
      setState(() {
        loading = false;
        isPackage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBarTitle = ModalRoute.of(context)?.settings.arguments as String;
    if (isPackage) {
      getAllPackagesList(appBarTitle);
    }

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Select your Package",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 27,color: CustomColor.whiteColor),
        ),
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
      body: Container(
        width: screenSize.width,
        //height: screenSize.height,
        decoration: const BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 20,
            ),
            !loading
                ? SizedBox(
              height: screenSize.height * 0.5,
                  child: ListView.builder(
                      itemCount: _packages?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, BookingForm.routeName,
                                    arguments: {"packageId":_packages![index].packageId,"vehicleType":appBarTitle});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 280,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.only(topRight: Radius.circular(27),bottomLeft: Radius.circular(27)),
                                    gradient:  LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xffff426b),
                                        Color(0xffff92aa),
                                        Color(0xffff426b),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(
                                                      8.0),
                                              child: Text(
                                                (_packages![index]
                                                            .packageName ==
                                                        null)
                                                    ? ""
                                                    : _packages![index]
                                                        .packageName!,
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.w800,
                                                    color: CustomColor
                                                        .whiteColor),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "₹ ${_packages![index].packagePrice ?? "0"}",
                                              style: TextStyle(
                                                  color: CustomColor
                                                      .whiteColor,
                                                  fontSize: 28,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 23,top: 3,right: 10),
                                        child:  Row(
                                          children: [
                                            Text(
                                              "${_packages![index].packageDuration ?? "0"} / Month",
                                              style: TextStyle(
                                                  color: CustomColor
                                                      .whiteColor,
                                                  fontSize: 28,
                                                  fontWeight:
                                                  FontWeight
                                                      .w700),
                                            ),
                                            Spacer(),
                                            Text( "${_packages![index].packageType ?? "vehicle"}",style: TextStyle(color: Colors.greenAccent,fontSize: 19,fontWeight: FontWeight.w700),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Container(
                                        height: 4,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(
                                            begin: Alignment
                                                .bottomRight,
                                            end: Alignment
                                                .bottomLeft,
                                            colors: [
                                              Color(0xfff8345e),
                                              Color(0xfff1a2b2),
                                              Color(0xfff8345e),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.all(
                                                8.0),
                                        child: Column(
                                          children: [

                                            Padding(
                                              padding:
                                                  const EdgeInsets
                                                      .all(8.0),
                                              child: Align(
                                                alignment: Alignment
                                                    .topLeft,
                                                child: SizedBox(
                                                  height: screenSize.height * 0.15,
                                                  child: SingleChildScrollView(
                                                    child: HtmlWidget(
                                                      _packages![index]
                                                          .packageFeaturesName!
                                                          .toString(),
                                                      textStyle: TextStyle(
                                                        fontSize: 22,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom:0,
                              left:70,
                              right:70,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffe30000),width: 2),
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(27),bottomLeft: Radius.circular(27)),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xffff859f),
                                      Color(0xffff859f),
                                      Color(0xffff859f),
                                    ],
                                  ),
                                ),
                                child: InkWell(
                                  onTap:(){
                                    Navigator.pushNamed(
                                        context, BookingForm.routeName,
                                        arguments: {"packageId":_packages![index].packageId,"vehicleType":appBarTitle});

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                                    child: Center(child: Text("Select",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),)),
                                  ),
                                ),
                              )
                              ,),
                          ],
                        );
                      }),
                )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
            // : SizedBox()
          ],
        ),
      ),

    );
  }
}
