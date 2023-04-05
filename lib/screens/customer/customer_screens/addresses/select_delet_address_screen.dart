import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({Key? key}) : super(key: key);

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined,color: CustomColor.whiteColor,)),
        title: Text("Addresses",style: TextStyle(color: CustomColor.whiteColor),),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(19),topLeft: Radius.circular(19))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
             Text("Select Address",style: TextStyle(fontSize: 20,color: CustomColor.primaryColor,fontWeight: FontWeight.w700),)

            ],
          ),
        ),
      ),
    );
  }
}
