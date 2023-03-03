import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';

class BookingServiceCard extends StatefulWidget {
  const BookingServiceCard({Key? key}) : super(key: key);

  @override
  State<BookingServiceCard> createState() => _BookingServiceCardState();
}

class _BookingServiceCardState extends State<BookingServiceCard> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: screenSize.height * 0.25,

        decoration:  BoxDecoration(
            color: CustomColor.whiteColor,
            boxShadow: const
            [
              BoxShadow(
                color: Color(0xffe5e5e5),
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Service Provider Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                      SizedBox(height: 3,),
                      Text("Booking ID - 12345678",style: TextStyle(fontSize: 15,color:Colors.grey, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Spacer(),
                  Text("Jan 27, 2023"),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      //view booking form in filled category
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffffbeab),
                        borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("View Detail",style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                        ),),
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.dangerous,color: Color(0xffffd7d7),size: 40,),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("General Service",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: CustomColor.primaryColor),),
                      SizedBox(height: 3,),
                      Text("Vehicle Number- XX23456",style: TextStyle(fontSize: 15,color:Colors.grey, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Spacer(),
                  Text("Pending",style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600),),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
