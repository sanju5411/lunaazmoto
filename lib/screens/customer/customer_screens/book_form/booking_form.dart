import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
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

  AuthUser? _userMob;
  int? _radioSelected;
  String? _radioVal;

  bool loading = false;

  final TextEditingController _vehicNameController =       TextEditingController();
  final TextEditingController _phoneController =      TextEditingController();
  final TextEditingController _serviceDateController = TextEditingController();
  final TextEditingController _serviceTimeController   = TextEditingController();
  final TextEditingController _vehicleNumController     = TextEditingController();
  final TextEditingController _addressController        =     TextEditingController();


  bool _validate = false;

  @override
  void initState() {
    _serviceTimeController.text = "";
    _serviceDateController.text = "";
    _radioSelected  = 2;

    //_phoneController.text = _userMob!.mobile = "";

    super.initState();

  }

  void _setBookingFormData(Map<String, String> jsonInput) async {



    loading = true;

    BookingModel bookingModel = await ApiService.setBookingForm(jsonInput: jsonEncode(jsonInput));

    print("booking form data>>>>>${jsonEncode(bookingModel)}>>>>");


    if(bookingModel.status  == "success"){
      loading = false;
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

  void _showTimePicker() async{

    TimeOfDay?  pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

    ).then((value) {
      setState(() {
        print("time>>>>>${value?.hour}-${value?.minute}-${value?.periodOffset}");
        String timeFormat  = "${value?.format(context)}";



        _serviceTimeController.text = timeFormat.toString();

      });
    });

  if(pickedTime != null){
    print(pickedTime.format(context));

  }else{
    print("Time is not selected");
  }
  }


  // @override
  // void dispose() {
  //   _vehicNameController.dispose();
  //   _phoneController.dispose();
  //   _serviceDateController.dispose();
  //   _serviceTimeController.dispose();
  //   _vehicleNumController.dispose();
  //   _addressController.dispose();
  //   super.dispose();
  // }



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
                    Text("Vehicle Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xffdcdcdc),
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    controller: _vehicNameController,
                    validator: (value) =>
                    value!.isEmpty? 'Password cannot be blank' : null,
                    decoration: InputDecoration(
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(
                        Icons.person,
                        color: Color(0xffc40000),
                      ),
                      hintText: 'Enter Vehicle Name',

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
                    Text("Phone Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(
                            Icons.call,
                            color: Color(0xffc40000),
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
                    Text("Service Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                              color:Color(0xffc40000),

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
                    Text("Service Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                          suffixIcon: InkWell(
                            onTap: () {
                              _showTimePicker();

                            },
                            child: const Icon(
                              Icons.access_time_filled_outlined,
                              color:Color(0xffc40000),

                            ),
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
                        readOnly: true,
                        onTap: (){
                          _showTimePicker();
                        },
                      ),
                    ),
                    SizedBox(height: 25,),
                    Text("Vehicle Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                            color: Color(0xffc40000),
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
                    Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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
                            color: Color(0xffc40000),
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
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("We Accept only COD",style: TextStyle(color: Colors.red,fontSize: 17),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Online Cash'),
                          Radio(

                            value: 1,
                            groupValue: _radioSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value as int;
                                _radioVal  = 'Online Cash';
                              });
                            },
                          ),
                          Text('Cash On Delivery'),
                          Radio(
                            value: 2,
                            groupValue: _radioSelected,
                            activeColor: Colors.pink,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = value as int?;
                                _radioVal  = 'Cash On Delivery';
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    CustomButton(

                      onTap: () async {
                        var vehicleName  = _vehicNameController.text.toString();
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
                            "vehicle_type":"two_wheeler",
                            "vehicle_name": vehicleName,
                            "vehicle_number": vehicleNum,
                            "instructions":"instructions",
                            "payment_method":_radioSelected.toString(),
                            "payment_details":"",
                            "payment_status":"due",
                            "user_address": address,
                        };


                          _setBookingFormData(jsonInput);



                       print("object>>>>${_radioVal.toString()}>>>>");

                        print("mapp>>>>>>>>>>&&&>>${jsonEncode(jsonInput)}>>>>>>>>>>>>");


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




