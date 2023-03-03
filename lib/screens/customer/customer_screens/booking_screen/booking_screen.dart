import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_plan_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: CustomColor.whiteColor,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      const Text("Online Bike, Car",style: TextStyle(fontSize: 30,color: CustomColor.whiteColor),),
                      const SizedBox(height: 10,),
                      const Text("Service Booking",style: TextStyle(fontSize: 35,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                      const SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  //here we add let long
                                },
                                child: Icon(Icons.location_on,color: CustomColor.primaryColor,)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Current Location",
                            fillColor: Colors.white),
                      )
                    ],),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                  color: CustomColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: 10,),
                      Text("Select your Package",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                      SizedBox(height: 20,),
                      SizedBox(
                        width:screenSize.width,
                        height: 530,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingForm()));
                              },
                              child: CustomPlaneBasic(),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingForm()));

                              },
                              child: CustomPlaneGold(),),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingForm()));

                              },
                              child: CustomPlanePlatinum(),),
                          ],
                        ),
                      )
                  ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
