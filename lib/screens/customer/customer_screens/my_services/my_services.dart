import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_booking_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/dashboard_model.dart';
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

  List<dynamic> lastServices = [];
  Dashboard? _dashboard;
  List<ServiceModel> serviceModel = [];

  _getDashboardData() async {
    setState(() {
      loading = true;
    });


    Dashboard dashboard = await ApiService.dashboard("customers");


    if (mounted) {
      setState(() {
        _dashboard = dashboard;
        if (_dashboard!.serviceModel != null &&
            _dashboard!.serviceModel!.isNotEmpty) {
          lastServices = _dashboard!.serviceModel!;
          serviceModel = _dashboard!.serviceModel!;}
        loading = false;
      });
    }
    // _createSlider();
   // _createBannerSlider();
  }

  @override
  void initState() {
    _getDashboardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60,),
            Container(
              width: screenSize.width,
              //height: screenSize.height,
              decoration: const BoxDecoration(
                  color: CustomColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Row(
                     children: [
                      const Text("Ongoing Services",style: TextStyle(
                         fontWeight: FontWeight.w800,
                         fontSize: 25
                     ),),
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
                    const SizedBox(height: 20,),
                    const BookingServiceCard(),
                    const SizedBox(height: 90,),
                    const Text("Last Services",style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30
                    ),),
                    const SizedBox(height: 20,),
                    serviceModel.isNotEmpty ?
                    SizedBox(
                      width: screenSize.width,
                     height: screenSize.height,
                      child: ListView.builder(
                          itemCount: serviceModel.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            print("Last Servies--->${serviceModel[index]}");
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
                                        color: Colors.grey,
                                        offset: Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
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
                                              Text(serviceModel[index].bookingCenter!.shopName.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                              const SizedBox(height: 3,),
                                              Row(children: [
                                                const Text("Booking ID -"),
                                                const SizedBox(width: 7,),
                                                Text(lastServices[index].bookingId.toString())
                                              ],)
                                            ],
                                          ),
                                          Spacer(),
                                          Text(lastServices[index].bookingDate.toString()),
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
                                                Text("Vehicle No. -"),
                                                SizedBox(width: 7,),
                                                Text((lastServices[index].bookingVehNum.toString()),),
                                              ],)
                                            ],
                                          ),
                                          Spacer(),
                                          Text((lastServices[index].bookingPaymentStatus.toString()),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ) : SizedBox(),

                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
