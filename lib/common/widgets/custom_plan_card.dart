import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';

class CustomPlaneBasic extends StatefulWidget {
  const CustomPlaneBasic({Key? key}) : super(key: key);

  @override
  State<CustomPlaneBasic> createState() => _CustomPlaneBasicState();
}

class _CustomPlaneBasicState extends State<CustomPlaneBasic> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff006665),
              Color(0xff3FC5AD),
              Color(0xff107E77),

            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("LunaazMoto",style: TextStyle(fontSize: 15,color: CustomColor.whiteColor),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Basic",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: CustomColor.whiteColor),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 10,
              width: screenSize.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: [
                            Color(0xff006665),
                    Color(0xff3FC5AD),
                    Color(0xff107E77),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                  Text("Rs.600/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough
                  ),),
                  SizedBox(width: 17,),
                  Text("Rs.500/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 28,

                      fontWeight: FontWeight.w700
                  ),),
                ],),
                SizedBox(height: 30,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Service",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Washings",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Shining",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
}




class CustomPlaneGold extends StatefulWidget {
  const CustomPlaneGold({Key? key}) : super(key: key);

  @override
  State<CustomPlaneGold> createState() => _CustomPlaneGoldState();
}

class _CustomPlaneGoldState extends State<CustomPlaneGold> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffFB5A7C),
              Color(0xffFE6585),
              Color(0xffFE184A),

            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("LunaazMoto",style: TextStyle(fontSize: 15,color: CustomColor.whiteColor),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Gold",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: CustomColor.whiteColor),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 10,
              width: screenSize.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffFB5A7C),
                    Color(0xffFE6585),
                    Color(0xffFE184A),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(children: [
                  Text("Rs.700/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough
                  ),),
                  SizedBox(width: 17,),
                  Text("Rs.650/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700
                  ),),
                ],),
                SizedBox(height: 30,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Service",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Washings",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Oiling",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("Polising",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  Text("check all particals",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),),

                ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
}




class CustomPlanePlatinum extends StatefulWidget {
  const CustomPlanePlatinum({Key? key}) : super(key: key);

  @override
  State<CustomPlanePlatinum> createState() => _CustomPlanePlatinumState();
}

class _CustomPlanePlatinumState extends State<CustomPlanePlatinum> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffababab),
              Color(0xffbfbfbf),
              Color(0xff8e8e8e),

            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("LunaazMoto",style: TextStyle(fontSize: 15,color: CustomColor.whiteColor),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Platinum",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800,color: CustomColor.whiteColor),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 10,
              width: screenSize.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffbbbbbb),
                    Color(0xffd4d4d4),
                    Color(0xffbebebe),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(children: [
                  Text("Rs.900/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 20,
                      decoration: TextDecoration.lineThrough
                  ),),
                  SizedBox(width: 17,),
                  Text("Rs.850/-",style: TextStyle(
                      color: CustomColor.whiteColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700
                  ),),
                ],),
                SizedBox(height: 30,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                      width:180,
                      child: Text("Service",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                      width:180,
                      child: Text("Washing",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                      width:180,
                      child: Text("Replace the air filter",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),

                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                      width:180,
                      child: Text("Replace the fuel filter",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),

                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                      width:180,
                      child: Text("Replace the spark plugs",
                        style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),

                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.check_circle,color: CustomColor.whiteColor,),
                  SizedBox(width: 20,),
                  SizedBox(
                    width:180,
                  child: Text("Check level and refill brake fluid",style: TextStyle(fontSize: 18,color: CustomColor.whiteColor),)),

                ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
}
