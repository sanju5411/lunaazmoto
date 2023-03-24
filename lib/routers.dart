import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/builders/custom_page_route.dart';
import 'package:lunaaz_moto/screens/auth/login_screen.dart';
import 'package:lunaaz_moto/screens/auth/otp_screen.dart';
import 'package:lunaaz_moto/screens/bike_delivery/booking_detail/booking_detail.dart';
import 'package:lunaaz_moto/screens/bike_delivery/delivery_dashboard/delivery_dashboard.dart';
import 'package:lunaaz_moto/screens/bike_delivery/notification_screen/notification_screen.dart';
import 'package:lunaaz_moto/screens/bike_delivery/select_service_center/dropdown_service_center.dart';
import 'package:lunaaz_moto/screens/bike_delivery/total_booking_screen/total_booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/booking_screen/booking_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/dashboard_screen/dashboard_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/fill_form/fill_out_form.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_services.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/profile_screen/profile_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/side_navbar/side_navbar.dart';
import 'package:lunaaz_moto/screens/intro/intro_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/CustomerBookingDetail/customer_booking_detail.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/customer_list/customer_common_list.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_dashboard/vendor_dashboard_screen.dart';
import 'package:lunaaz_moto/screens/service_centre/screens/vendor_notification/vendor_notification.dart';

import 'screens/customer/customer_screens/cust_booking_detail/customer_booking_detail.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final arguments = routeSettings.arguments;
  switch (routeSettings.name) {
    case IntroScreen.routeName:
      return CustomPageRoute(
        child:  IntroScreen(),
        routeSettings: routeSettings,
      );


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Auth Router>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.

    case LoginScreen.routeName:
      return CustomPageRoute(
        child:  const LoginScreen(),
        routeSettings: routeSettings,
      );


    case OtpScreen.routeName:
      return CustomPageRoute(
        child: const OtpScreen(),
        routeSettings: routeSettings,
      );


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Customer Router>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.


    case DashboardScreen.routeName:
      return CustomPageRoute(
        child:   DashboardScreen(),
        routeSettings: routeSettings,
      );

    case BookingForm.routeName:
      return CustomPageRoute(
        child:   const BookingForm(),
        routeSettings: routeSettings,
      );

    case CustomerBookingDetail.routeName:
      return CustomPageRoute(
        child:   CustomerBookingDetail(),
        routeSettings: routeSettings,
      );

    case BookingScreen.routeName:
      return CustomPageRoute(
        child:   BookingScreen(),
        routeSettings: routeSettings,
      );

    case MyServicesScreen.routeName:
      return CustomPageRoute(
        child:  const MyServicesScreen(),
        routeSettings: routeSettings,
      );


    case ProfileScreen.routeName:
      return CustomPageRoute(
        child:  const ProfileScreen(),
        routeSettings: routeSettings,
      );


    case FillformScreen.routeName:
      return CustomPageRoute(
        child:  const FillformScreen(),
        routeSettings: routeSettings,
      );

    case NavCusDrawer.routeName:
      return CustomPageRoute(
        child:   NavCusDrawer(),
        direction: AxisDirection.right,
        routeSettings: routeSettings,
      );




  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Service Screen Router>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.

    case ServiceDashboard.routeName:
      return CustomPageRoute(
        child:   ServiceDashboard(appBartitle: arguments.toString(),),


        routeSettings: routeSettings,
      );

    case CustomerCommonList.routeName:
      return CustomPageRoute(
        child:  const CustomerCommonList(appBartext: '',),
        routeSettings: routeSettings,
      );

    case VendorNotification.routeName:
      return CustomPageRoute(
        child:  const VendorNotification(),
        routeSettings: routeSettings,
      );

    case CustomerBookingInfo.routeName:
      return CustomPageRoute(
        child:  const CustomerBookingInfo(),
        routeSettings: routeSettings,
      );



  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Deliver Person Screen Router>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.

    case DeliveryDashboard.routeName:
      return CustomPageRoute(
        child:  const DeliveryDashboard(),
        routeSettings: routeSettings,
      );

    case TotalBookingScreen.routeName:
      return CustomPageRoute(
        child:  const TotalBookingScreen(),
        routeSettings: routeSettings,
      );

    case NotificationScreen.routeName:
      return CustomPageRoute(
        child:  const NotificationScreen(),
        routeSettings: routeSettings,
      );

    case BookingDetail.routeName:
      return CustomPageRoute(
        child:  const BookingDetail(),
        routeSettings: routeSettings,
      );

    case ServiceCenterDropDown.routeName:
      return CustomPageRoute(
        child:  const ServiceCenterDropDown(),
        routeSettings: routeSettings,
      );






    default:
      return CustomPageRoute(
          child: const Scaffold(
            body: Center(
              child: Text('Screen does not exists '),
            ),
          ));
  }
}
