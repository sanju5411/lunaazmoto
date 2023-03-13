import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
class CustomLastService extends StatefulWidget {
  const CustomLastService({Key? key}) : super(key: key);

  @override
  State<CustomLastService> createState() => _CustomLastServiceState();
}

class _CustomLastServiceState extends State<CustomLastService> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: screenSize.height * 0.18,
        width: screenSize.width,
        decoration:  BoxDecoration(
            color: CustomColor.whiteColor,
            boxShadow: const
            [
              BoxShadow(
                color: Colors.grey,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("General Service",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: CustomColor.primaryColor),),
                      SizedBox(height: 3,),
                      Text("Vehicle Number- XX23456",style: TextStyle(fontSize: 15,color:Colors.grey, fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Spacer(),
                  Text("Paid",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
