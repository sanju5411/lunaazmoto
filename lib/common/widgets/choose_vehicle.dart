import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';


class CustomWheelerPopUp extends StatefulWidget {
  static const String routeName = '/wheeler_popup';

  const CustomWheelerPopUp({Key? key}) : super(key: key);

  @override
  State<CustomWheelerPopUp> createState() => _CustomWheelerPopUpState();
}

class _CustomWheelerPopUpState extends State<CustomWheelerPopUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffffebeb),
      body: Dialog(
        child: Container(
          height: 270.0,
          width: 270.0,
          decoration: BoxDecoration( borderRadius : BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                    text: "Two Wheeler",
                    onTap: (){

                    }),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                    text: "Three Wheeler",
                    onTap: (){

                             }),
              ),
              SizedBox(height:10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                    text: "Four Wheeler",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingForm()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
