import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/drivers/new_services.dart';
import 'package:lunaaz_moto/screens/bike_delivery/booking_detail/booking_detail.dart';
import 'package:lunaaz_moto/screens/bike_delivery/notification_screen/notification_screen.dart';

class TotalBookingScreen extends StatefulWidget {
  static const String routeName = '/total_booking_vehicle';
  const TotalBookingScreen({Key? key}) : super(key: key);
  @override
  State<TotalBookingScreen> createState() => _TotalBookingScreenState();
}

class _TotalBookingScreenState extends State<TotalBookingScreen> {

  @override
  Widget build(BuildContext context) {

    final appBarTitle = ModalRoute.of(context)?.settings.arguments as String;

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: Text(appBarTitle,style: TextStyle(fontSize: 19),),
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(
              Icons.arrow_back_outlined,color: CustomColor.whiteColor,
            ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (){
                //Navigator.pushNamed(context, NotificationScreen.routeName);
              },
                child: Icon(Icons.notifications_active,color: CustomColor.whiteColor,),
            ),
          ),
        ],
      ),
      body: Container(
        width: screenSize.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: CustomColor.whiteColor,
        ),
        child: SingleChildScrollView(
          physics:  const ScrollPhysics(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white, // Your desired background color
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Color.fromRGBO(
                                  209, 249, 255, 0.5058823529411764), blurRadius: 10),
                            ]
                        ),
                        child:  InkWell(
                          onTap: (){
                            //Navigator.pushNamed(context, BookingDetail.routeName);
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
                              backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                            ),
                            title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                            subtitle: const Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                            trailing: Column(
                              children: [
                                Icon(Icons.remove_red_eye,color: Colors.cyan,),
                                SizedBox(height: 10,),
                                Text("New Booking",style: TextStyle(color: Colors.deepPurpleAccent),)
                              ],
                            ),
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
                    return  Padding(
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
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, BookingDetail.routeName);
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
                              backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                            ),
                            title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                            subtitle: const Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                       trailing: Column(
                           children: [
                             Icon(Icons.remove_red_eye,color: Colors.cyan,),
                             SizedBox(height: 10,),
                             Text("New Booking",style: TextStyle(color: Colors.deepPurpleAccent),)
                           ],
                       ),
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
