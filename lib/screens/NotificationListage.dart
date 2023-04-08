import 'dart:convert';

import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: Text("List View bana k baaki ka kaam kar do ab"),
      ),
    );
  }
  }