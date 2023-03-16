import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class DeliveryDashboard extends StatefulWidget {
  static const String routeName = '/delivery_vehicle';

  const DeliveryDashboard({Key? key}) : super(key: key);

  @override
  State<DeliveryDashboard> createState() => _DeliveryDashboardState();
}

class _DeliveryDashboardState extends State<DeliveryDashboard> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 60,),
              Container(
                width: screenSize.width,
                decoration: const BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Today's Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),),
                        ],
                      )
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 110,
                              width: 110,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: const Color(0xFFA5D872)),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("30",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFF6FC11D)),),
                                  SizedBox(height: 10,),
                                  Text("Today\nBooking",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                ],
                              )
                          ),
                          Container(
                              height: 110,
                              width: 110,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: const Color(0xFFEFA315)),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("20",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFFEFA315)),),
                                  SizedBox(height: 10,),
                                  Text("Today\nPicked Up",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                ],
                              )
                          ),
                          Container(
                              height: 110,
                              width: 110,
                              decoration:  BoxDecoration(
                                  border: Border.all(color: const Color(0xFFFF2121)),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("30",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Color(0xFFFF2121)),),
                                  SizedBox(height: 10,),
                                  Text("Today\nBooking",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Next Booking",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("See all",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Color(0xFF820000)),),
                          ],
                        )
                    ),
                    const SizedBox(height: 20,),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return  Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white, // Your desired background color
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(color: Color.fromRGBO(255, 164, 124,0.2), blurRadius: 10),
                                ]
                            ),
                            child: ListTile(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage("https://assets.pokemon.com/assets/cms2/img/pokedex/detail/043.png"), // No matter how big it is, it won't overflow
                              ),
                              title: const Text("Rimma Roy",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                              subtitle: const Text("09 JAN 2022, 8am - 10am",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF8C8FA5)),),
                            ),
                          );
                        }),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
