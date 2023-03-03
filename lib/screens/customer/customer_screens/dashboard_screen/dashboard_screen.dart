import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/happyclient_model/happy_client_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard_screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {

  static List<String>  clientname  = [
    'vijay',
    'ajay',
    'lokesh',
    'ram',
    'jeckson',
    'denny',
    'stanny',
    'stan',
    'divine',
    'puneet',
  ];
  static List  clientimage  = [
   'https://picsum.photos/id/237/200/300',
   'https://picsum.photos/seed/picsum/200/300',
   'https://picsum.photos/200/300?grayscale',
   'https://picsum.photos/200/300/?blur',
   'https://picsum.photos/id/870/200/300?grayscale&blur=2',
   'https://picsum.photos/200/300.webp',
   'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT282PNaYtOo38sS_8kjLLdkNdB2GekgSuSQ&usqp=CAU',
   'https://pbs.twimg.com/media/D8Dp0c5WkAAkvME.jpg',
   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcz_MYOqCPIysDzuSS5cJyWA9j7yV8fZJw2tTdB7BU&s',
   ];

  final List<HappyClientModel> happy_client_data = List.generate(clientname.length, (index) => HappyClientModel('${clientname[index]}', '${clientimage[index]}'),);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: CustomColor.whiteColor,
      appBar: PreferredSize(
        preferredSize: const  Size.fromHeight(120),
              child: Container(
                color: CustomColor.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 45,right: 10,left: 10),
                  child: Row(
                    children:   [
                      Icon(Icons.menu,color: CustomColor.whiteColor,),
                      Spacer(),
                      Text("LunaazMoto ",style:
                      const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: CustomColor.whiteColor),
                      ),
                      Spacer(),
                       InkWell(
                         onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),

                         child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/dpp.jpg"),
                      ),
                       ),
                    ],
                  ),
                ),
              ),
      ),
    body: StretchingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:300,
              width: screenSize.width,
              decoration:const  BoxDecoration(
                color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),),
              child: CarouselSlider(

                options: CarouselOptions(height: 200.0),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 50,
                            width: screenSize.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: const   DecorationImage(
                                fit: BoxFit.fill,
                                image:  AssetImage("assets/images/engin_poster.jpg",)
                              ),
                              borderRadius: BorderRadius.circular(20),
                                color: Colors.amber
                            ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding:  EdgeInsets.only(left: 20,top: 20,bottom: 10),
              child: Text("Happy clients",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),),
            const SizedBox(height: 20,),
          SizedBox(
          height: 120,
          width: screenSize.width,
          child: ListView.builder(
            padding: EdgeInsets.all(0.0),
            itemCount: happy_client_data.length,
           // itemExtent: 300.0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                   CircleAvatar(
                    backgroundColor: Colors.red,
                    maxRadius: 30,
                    backgroundImage: NetworkImage(happy_client_data[index].ImageUrl),
                  ),
                  SizedBox(height: 5,),
                  Text(happy_client_data[index].name,style: TextStyle(fontSize: 20),)
                ],),
              );
              }
          ),
           ),
            const SizedBox(height: 15,),
            Container(
              decoration: const  BoxDecoration(
                color: Color(0xffffe9e2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),topRight:  Radius.circular(20),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                         height:screenSize.height * 0.2,
                         width: screenSize.width * 0.4,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffEC5FA3),
                              Color(0xffD72F81),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Service",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                            SizedBox(height: 10,),
                            CircleAvatar(
                              backgroundColor: CustomColor.whiteColor,
                              child: Text("9",style: TextStyle(color: Color(0xffD72F81),fontSize: 18,fontWeight: FontWeight.w600),),
                            )
                          ],),
                      ), //total service
                      Spacer(),
                      Container(

                        height:screenSize.height * 0.2,
                       width: screenSize.width * 0.4,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xffDA8334),
                              Color(0xffCF8849),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Today Service",style: TextStyle(color: CustomColor.whiteColor,fontSize: 20),),
                            SizedBox(height: 10,),
                            CircleAvatar(
                              backgroundColor: CustomColor.whiteColor,
                              child: Text("9",style: TextStyle(color: Color(0xffCF8849),fontSize: 18,fontWeight: FontWeight.w600),),
                            )
                          ],),
                      ), //today service

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(

                    textWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Book Now',style: TextStyle(fontSize: 20,color: CustomColor.whiteColor),),
                    ),
                    variant: Variant.booknowbtn,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(),
                      ),
                      );
                    },

                  ),
                ),
                const SizedBox(height: 15,),
                const Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20,bottom: 10),
                  child: Text("Last Services",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
                ),
                const SizedBox(height: 20,),
                Padding(
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
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("View all > ",style: TextStyle(color: CustomColor.primaryColor,fontSize: 20,fontWeight: FontWeight.w700),)),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(

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
                      child:   Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Having Problems ?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: CustomColor.primaryColor),),
                                SizedBox(height: 3,),
                                Text("Let us help you out !",style: TextStyle(fontSize: 15,color:Colors.grey, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
                              borderRadius: BorderRadius.circular(15),

                            ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.arrow_forward_outlined,color: CustomColor.whiteColor,),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
              ],
            ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
//
// body: Container(
// height: screenSize.height,
// width: screenSize.width,
// decoration: const  BoxDecoration(
// color: CustomColor.whiteColor,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10),
// topRight: Radius.circular(10),
// )
// ),
// child: Column(),
// ),
