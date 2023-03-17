import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
class BookingDetail extends StatefulWidget {
  static const String routeName = '/booking_detail';
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined,color: Colors.black,),
        ),
        backgroundColor: CustomColor.whiteColor,
        title: Text("Booking Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Padding(
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
                    // Navigator.pushNamed(context, CustomerBookingInfo.routeName);
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
                        backgroundImage: NetworkImage("https://cdn.hswstatic.com/gif/play/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"), // No matter how big it is, it won't overflow
                      ),
                      title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                      subtitle: const Text("09 JAN 2022, 8am - 10am\nNewyork, United States",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                      trailing:  Text("New Booking",style: TextStyle(color: Colors.deepPurpleAccent),)
                  ),
                ),
              ),
            ),
            Container(
              //height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),
                  color: CustomColor.primaryColor
              ),
              child: Column(
                children: [
                  SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 17),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x54ffffff)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.call,color: CustomColor.whiteColor,),
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0x54ffffff)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.video_call_rounded,color: CustomColor.whiteColor,),
                          ),
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Riya Singh",style: TextStyle(fontSize: 20,color: CustomColor.whiteColor,fontWeight: FontWeight.w700),),
                            SizedBox(height: 5,),
                            Text(" Newyork, United States",style: TextStyle(fontSize: 13,color: CustomColor.whiteColor,fontWeight: FontWeight.w500),),
                            SizedBox(height: 5,),
                            Text("10 Jan 2022  @ 10:00 AM",style: TextStyle(fontSize: 17,color: CustomColor.whiteColor,fontWeight: FontWeight.w600),),


                          ],)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    decoration: BoxDecoration(
                        color: CustomColor.whiteColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25,),
                          Text("Booking Service",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                          SizedBox(height: 8,),
                          Text("Select Type : Car Service",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                          SizedBox(height: 8,),
                          Text("Today-09 January,2020",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                          SizedBox(height: 8,),
                          Row(children: [
                            Icon(Icons.watch_later,color: Colors.grey,),
                            SizedBox(width: 10,),
                            Text("11:30 am - 12:30 pm",style: TextStyle(color:CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 15),),



                          ],),


                          SizedBox(height: 25,),
                          Text("Customer information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                          SizedBox(height: 8,),
                          Row(children: [
                            Icon(Icons.person,color: Colors.grey,),
                            SizedBox(width: 10,),
                            Text("Riya Singh",style: TextStyle(color:Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),



                          ],),
                          SizedBox(height: 8,),
                          Text("Phone  :  +918976656765  ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),


                          SizedBox(height: 25,),
                          Text("General Service",style: TextStyle(color: CustomColor.primaryColor,fontWeight: FontWeight.w600,fontSize: 20),),
                          SizedBox(height: 8,),
                          Text("Vehicle Number- XX23456",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),


                          SizedBox(height: 25,),
                          Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                          SizedBox(height: 8,),
                          Text("City : Jodhpur",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
                          SizedBox(height: 8,),
                          Text("Area : Sardarpura",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),


                          SizedBox(height: 25,),
                          Text("Add Live Link",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 19),),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        //here we add let long
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Icon(
                                          Icons.video_collection,
                                          color: CustomColor.primaryColor,
                                        ),
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintText: "Video Url",

                                  fillColor: Colors.white),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                            Text("Accept",style: TextStyle(color: Colors.green,fontSize: 30,),),
                            Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text("Reject",style: TextStyle(color: Colors.red,fontSize: 30,),),
                              ),
                          ],)


                        ],
                      ),
                    ),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
