import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/Notification/NotificationMainModel.dart';
import 'package:lunaaz_moto/models/Notification/Notifications.dart';

import '../services/api_service.dart';

class NotificationListPage extends StatefulWidget {
  static const String routeName = '/notification';

  const NotificationListPage({Key? key}) : super(key: key);

  @override
  State<NotificationListPage> createState() => _NotificationListPageState();
}

class _NotificationListPageState extends State<NotificationListPage>{

  List<Notifications> notification = [];
  void _getNotificationList() async {

    NotificationMainModel notificationMainModel = await ApiService.getNotificationData();
    print("Service Centers Main Model--->${jsonEncode(notificationMainModel)}");
    if(notificationMainModel.status == "success"){
      setState(() {
          notification = notificationMainModel.notifications!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.primaryColor,
        appBar: AppBar(
          backgroundColor: CustomColor.primaryColor,
          elevation: 0,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_back_outlined,color: CustomColor.whiteColor,),
            ),
          ),
          title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.w700,color: CustomColor.whiteColor),),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
               color: Color(0xffFFFAF2),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
            child: notification.isNotEmpty?
               SingleChildScrollView(
                 child: ListView.builder(
                  itemCount: notification.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {

                    return InkWell(
                      onTap: (){
                        // Navigator.pushNamed(context, MyServiceDetail.routeName,arguments: onGoingList[index],);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                        child: Container(
                          // height: screenSize.height * 0.18,
                          width: screenSize.width,
                          decoration:  BoxDecoration(
                              color: const Color(0xdafd4949),
                              borderRadius: BorderRadius.circular(18)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child:  Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: CustomColor.whiteColor,borderRadius: BorderRadius.circular(50),),
                                  child: const Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child: Icon(Icons.notifications,color: Colors.red,),

                                  ),
                                ),
                                const SizedBox(width: 8,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenSize.width * 0.7,
                                      child: AutoSizeText(

                                        notification[index].notificationTitle != null?notification[index].notificationTitle!.toString():"",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: CustomColor.whiteColor),
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 7,),
                                    SizedBox(
                                      width: screenSize.width * 0.6,
                                      child: AutoSizeText(
                                        notification[index].notificationCreatedAt != null?notification[index].notificationCreatedAt!.toString():"",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: CustomColor.whiteColor),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
               ):Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffc2717b),
                      Color(0xff8687b6),
                    ],
                  )
              ),),
          ),
        ),
      ),
    );
  }
  }