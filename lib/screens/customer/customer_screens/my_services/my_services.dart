import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_booking_card.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);
  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {

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
                    const SizedBox(height: 100,),
                    const Text("Last Services",style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30
                    ),),
                    const SizedBox(height: 20,),


                SizedBox(
                  width: 350,
                  height: screenSize.height,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (_, index) {
                        return   const BookingServiceCard();
                      }),
                ),

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
