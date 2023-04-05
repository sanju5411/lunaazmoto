import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/CustomerBookingDetail/customer_booking_detail.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_dashboard/vendor_dashboard_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_notification/vendor_notification.dart';

class CustomerCommonList extends StatefulWidget {
  static const String routeName = '/customer_list';


  const CustomerCommonList({Key? key, required this.appBartext,}) : super(key: key);

  final String appBartext;


  @override
  State<CustomerCommonList> createState() => _CustomerCommonListState();
}

class _CustomerCommonListState extends State<CustomerCommonList> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    //final args = ModalRoute.of(context)!.settings.arguments as ServiceDashboard;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
        title: Text(widget.appBartext),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined,color: CustomColor.whiteColor,)),
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, VendorNotification.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_active,color: CustomColor.whiteColor,),
            ),
          )
        ],
      ),
      body: Container(
        width: screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: CustomColor.whiteColor,
        ),
        child: SingleChildScrollView(
          physics:  ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Today",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, CustomerBookingInfo.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white, // Your desired background color
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Color.fromRGBO(255, 164, 124,0.2), blurRadius: 10),
                              ]
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                                ),
                              ),
                              SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Customer Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                                        SizedBox(width: 5,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(17),
                                              color: Color(0xffe4eeff)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Pending",style: TextStyle(fontSize: 14,color: Color(
                                                0xff1D3A70),),),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Text("Vehicle Number",style: TextStyle(fontSize: 18,color: Colors.black54),),
                                    SizedBox(height: 6,),
                                    Text("Driver Details",style: TextStyle(fontSize: 1,color: Colors.black54),),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontSize: 1,color: Colors.black45),),
                                        SizedBox(width: 8,),

                                        Text("View Details -->",style: TextStyle(color: CustomColor.primaryColor,fontSize: 19),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Yesterday",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, CustomerBookingInfo.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white, // Your desired background color
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(color: Color.fromRGBO(255, 164, 124,0.2), blurRadius: 10),
                              ]
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const CircleAvatar(
                                  backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                                ),
                              ),
                              SizedBox(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Customer Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                                        SizedBox(width: 5,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(17),
                                              color: Color(0xffe4eeff)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Pending",style: TextStyle(fontSize: 14,color: Color(
                                                0xff1D3A70),),),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Text("Vehicle Number",style: TextStyle(fontSize: 18,color: Colors.black54),),
                                    SizedBox(height: 6,),
                                    Text("Driver Details",style: TextStyle(fontSize: 1,color: Colors.black54),),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontSize: 1,color: Colors.black45),),
                                        SizedBox(width: 8,),

                                        Text("View Details -->",style: TextStyle(color: CustomColor.primaryColor,fontSize: 19),)
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),



            ],),
        ),
      ),
    );
  }
}
