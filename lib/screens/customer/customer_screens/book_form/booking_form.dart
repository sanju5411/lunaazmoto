import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/booking_model/booking_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_services.dart';
import 'package:lunaaz_moto/services/api_service.dart';

class BookingForm extends StatefulWidget {
  static const String routeName = '/booking_form_screen';

  const BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {

  final TextEditingController _nameController =       TextEditingController();
  final TextEditingController _phoneController =      TextEditingController();
  final TextEditingController _serviceDateController = TextEditingController();
  final TextEditingController _serviceTimeController   = TextEditingController();
  final TextEditingController _vehicleNumController     = TextEditingController();
  final TextEditingController _addressController        =     TextEditingController();


  @override
  void initState() {
    _serviceDateController.text = "";
    super.initState();

  }

  void _setBookingFormData(Map<String, String> jsonInput) async {

    BookingModel bookingModel = await ApiService.setBookingForm(jsonInput: jsonEncode(jsonInput));

    print("booking form data>>>>>${jsonEncode(bookingModel)}>>>>");


    if(bookingModel.status  == "success"){
      setState(() {
        Navigator.pushNamed(context, MyServicesScreen.routeName);
      });
    }


}

  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        String dateFormat  = "${value!.year}-${value!.month}-${value!.day}";
        _dateTime = value!;

        _serviceDateController.text = dateFormat.toString();

      });
    });
  }



  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
          ,),
        title: Text("Booking Form",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width: screenSize.width,
              //height: screenSize.height,
              decoration: const BoxDecoration(
                color: CustomColor.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    const Text("Booking Service",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                    ),),
                    const SizedBox(height: 20,),
                    SizedBox(height: 10,),
                    Text("Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xffdcdcdc),
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    controller: _nameController,

                    decoration: InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Color(0xff224597),
                      ),
                      hintText: 'Enter Full Name',

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                    SizedBox(height: 25,),
                    Text("Phone Number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                           BoxShadow(
                             color: Color(0xffdcdcdc),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _phoneController,

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.call,
                            color: Color(0xff224597),
                          ),
                          hintText: 'Enter Phone Number',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Service Date",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0xffdcdcdc),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _serviceDateController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: InkWell(
                            onTap: (){
                              _showDatePicker();
                            },
                            child: const Icon(
                              Icons.calendar_today,
                              color: Color(0xff224597),

                            ),
                          ),
                          hintText: 'MM-DD-YY',


                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        readOnly: true,
                        onTap: (){
                          _showDatePicker();

                        },
                      ),
                    ), //date>>>>>>>
                    SizedBox(height: 25,),
                    Text("Service Time",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0xffdcdcdc),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _serviceTimeController,
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.access_time_filled_outlined,
                            color: Color(0xff224597),
                          ),
                          hintText: 'HH-MM',

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Vehicle Number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0xffdcdcdc),
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _vehicleNumController,
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.car_crash_rounded,
                            color: Color(0xff224597),
                          ),
                          hintText: 'Enter your vehicle number',

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Address",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Color(0xffdcdcdc),
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _addressController,

                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.location_on,
                            color: Color(0xff224597),
                          ),
                          hintText: 'Enter your valid address',

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Pay online",style: TextStyle(fontSize: 17,color: Colors.blue,fontWeight: FontWeight.w800),),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Cash On Delivery",style: TextStyle(fontSize: 17,color: Colors.blue,fontWeight: FontWeight.w800),),
                        ),
                      ],),
                    ),
                    SizedBox(height: 20,),
                    CustomButton(

                      onTap: () async {
                        var name  = _nameController.text.toString();
                        var phoneNumber  = _phoneController.text.toString();
                        var serviceDate  = _serviceDateController.text.toString();
                        var serviceTime  = _serviceTimeController.text.toString();
                        var vehicleNum  = _vehicleNumController.text.toString();
                        var address  = _addressController.text.toString();

                        Map<String, String> jsonInput = {

                            "user_address_id": "1",
                            "package_id": "1",
                            "booked_date": serviceDate,
                            "booked_time": serviceTime,
                            "vehicle_type":"",
                            "vehicle_name": name,
                            "vehicle_number": vehicleNum,
                            "instructions":"instructions",
                            "payment_method":"cash",
                            "payment_details":"",
                            "payment_status":"due"
                        };

                        _setBookingFormData(jsonInput);

                        print("object${name} - ${phoneNumber} - ${serviceDate} - ${serviceTime} - ${vehicleNum} - ${address}>>>>");

                       // Navigator.push(context, MaterialPageRoute(builder: (context) => MyServicesScreen(),),);

                      },
                      text: "Book Service",

                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




