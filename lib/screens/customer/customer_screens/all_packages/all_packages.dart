import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';

class AllPackages extends StatefulWidget {
  static const String routeName = '/all_packages';
  const AllPackages({Key? key}) : super(key: key);

  @override
  State<AllPackages> createState() => _AllPackagesState();
}

class _AllPackagesState extends State<AllPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Packages"),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined,color: CustomColor.whiteColor,)),
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
      ),
      backgroundColor: CustomColor.whiteColor,
      body: Center(child: Text("Packages",style: TextStyle(fontSize: 30),),),
    );
  }
}
