import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/user_address_model/user_address_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/address_field/address_field.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/book_form/booking_form.dart';
import 'package:lunaaz_moto/services/api_service.dart';

class AddAddressScreen extends StatefulWidget {
  static const String routeName = '/add_address_screen';
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {

  bool isLoading = true;

  @override
  void initState() {



   // _setBookingFormData();
    super.initState();

  }

  void _setBookingFormData(Map<String, String> jsonInput) async {



    isLoading = true;

    AuthAddress _authAddress = await ApiService.setAddressForm(jsonInput: jsonEncode(jsonInput));

    print("booking form data>>>>>${jsonEncode(_authAddress)}>>>>");


    if(_authAddress.status  == "success"){
      isLoading = false;
      setState(() {
        Navigator.of(context)
            .pushReplacementNamed(BookingForm.routeName);
        // Navigator.pushNamed(context, MyServicesScreen.routeName);
      });
    }





  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: CustomColor.primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            CustomButton(
                onTap: (){},
              text: 'Current Location',

            ),
            const SizedBox(height: 10),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomButton(
                      onTap: () {
                        setState(() {

                        });
                      },
                      text:'Home',
                      height: 30,
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomButton(
                      onTap: () {
                        setState(() {

                        });
                      },
                      text: 'Office',

                      height: 30,
                    ),
                  ),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomButton(
                        onTap: () {
                          setState(() {

                          });
                        },
                        text:'Other',

                        height: 30,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Name',
                hintText: 'Enter Your Name',
              ),

            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Mobile Number',
                hintText: 'Enter Your Mobile Number',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Address Line 1',
                hintText: 'Enter Address Line 1',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Address Line 2',
                hintText: 'Enter Address Line 2',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Locality',
                hintText: 'Enter Your Locality',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Landmark',
                hintText: 'Enter Your Landmark',
              ),

            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: cityController,
                    decoration:
                    CustomInputDecoration.textInputDecoration.copyWith(
                      labelText: 'City',
                      hintText: 'Enter Your City',
                    ),

                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: TextFormField(
                    controller: cityController,
                    decoration:
                    CustomInputDecoration.textInputDecoration.copyWith(
                      labelText: 'Pincode',
                      hintText: 'Enter Your Pincode',
                    ),

                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: cityController,
                    decoration:
                    CustomInputDecoration.textInputDecoration.copyWith(
                      labelText: 'State',
                      hintText: 'Enter Your State',
                    ),

                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: TextFormField(
                    controller: cityController,
                    decoration:
                    CustomInputDecoration.textInputDecoration.copyWith(
                      labelText: 'Country',
                      hintText: 'Enter Your Country',
                    ),

                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                // var vehicleName  = _vehicNameController.text.toString();
                // var phoneNumber  = _phoneController.text.toString();
                // var serviceDate  = _serviceDateController.text.toString();
                // var serviceTime  = _serviceTimeController.text.toString();
                // var vehicleNum  = _vehicleNumController.text.toString();
                // var address  = _addressController.text.toString();
                //
                // Map<String, String> jsonInput = {
                //   "user_address_id": "1",
                //   "package_id": packageId.toString(),
                //   "booked_date": serviceDate,
                //   "booked_time": serviceTime,
                //   "vehicle_type":"two_wheeler",
                //   "vehicle_name": vehicleName,
                //   "vehicle_number": vehicleNum,
                //   "instructions":"instructions",
                //   "payment_method":_radioSelected.toString(),
                //   "payment_details":"",
                //   "payment_status":"due",
                //   "user_address": addressId.toString(),
                // };
                //
                // bool saveData = true;
                //
                // if(vehicleName.isEmpty){
                //   saveData = false;
                //   Fluttertoast.showToast(msg: "Please Enter Vehicle Name");
                //   return;
                // }
                //
                // if(phoneNumber.isEmpty){
                //   saveData = false;
                //   Fluttertoast.showToast(msg: "Please Enter Phone Number");
                //   return;
                // }
                //
                // if(serviceDate.isEmpty){
                //   saveData = false;
                //   Fluttertoast.showToast(msg: "Please Enter Date");
                //   return;
                // }
                //
                // if(serviceTime.isEmpty){
                //   saveData = false;
                //   Fluttertoast.showToast(msg: "Please Enter Time");
                //   return;
                // }
                //
                // if(vehicleNum.isEmpty){
                //   saveData = false;
                //   Fluttertoast.showToast(msg: "Please Enter Vehicle Number");
                //   return;
                // }
                //
                // // if(address.isEmpty){
                // //   saveData = false;
                // //   Fluttertoast.showToast(msg: "Please Enter Address");
                // //   return;
                // // }
                //
                // if(saveData){
                //   _setBookingFormData(jsonInput);
                // }
                //
                // print("object${saveData}");
                //
                // print("object>>>>${_radioVal.toString()}>>>>");
                //
                // print("mapp>>>>>>>>>>&&&>>${jsonEncode(jsonInput)}>>>>>>>>>>>>");
                //

              },
              text: 'Update Address',
             // loading: _loading,
            )
          ],
        ),
      ),
    );
  }
}
