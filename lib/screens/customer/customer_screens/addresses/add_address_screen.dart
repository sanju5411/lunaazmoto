import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final TextEditingController _titleController =       TextEditingController();
  final TextEditingController _nameController =      TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressLine1Controller   = TextEditingController();
  final TextEditingController _addressLine2Controller     = TextEditingController();
  final TextEditingController _localityController        =     TextEditingController();
  final TextEditingController _landmarkController        =     TextEditingController();
  final TextEditingController _cityController        =     TextEditingController();
  final TextEditingController _pincodeController        =     TextEditingController();
  final TextEditingController _stateController        =     TextEditingController();
  final TextEditingController _countryController        =     TextEditingController();

  bool isLoading = false;

  @override
  void initState() {




    super.initState();

  }

  void _setBookingFormData(Map<String, String> jsonInput) async {



    setState(() {
      isLoading = true;
    });

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
                     // variant: (_titleController.text == "Home") ? Variant.primary: Variant.booknowbtn,
                      onTap: () {
                        setState(() {
                          _titleController.text = "Home";
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
                          _titleController.text = "Office";
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
                            _titleController.text = "Other";
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
              controller: _nameController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Name',
                hintText: 'Enter Your Name',
              ),

            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _mobileController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Mobile Number',
                hintText: 'Enter Your Mobile Number',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _addressLine1Controller,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Address Line 1',
                hintText: 'Enter Address Line 1',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _addressLine2Controller,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Address Line 2',
                hintText: 'Enter Address Line 2',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _localityController,
              decoration: CustomInputDecoration.textInputDecoration.copyWith(
                labelText: 'Locality',
                hintText: 'Enter Your Locality',
              ),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _landmarkController,
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
                    controller: _cityController,
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
                    controller: _pincodeController,
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
                    controller: _stateController,
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
                    controller: _countryController,
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
                var title  = _titleController.text.toString();
                var name  = _nameController.text.toString();
                var mobile  = _mobileController.text.toString();
                var address1  = _addressLine1Controller.text.toString();
                var address2  = _addressLine2Controller.text.toString();
                var locality  = _localityController.text.toString();
                var landmark  = _landmarkController.text.toString();
                var city  = _cityController.text.toString();
                var pincode  = _pincodeController.text.toString();
                var state  = _stateController.text.toString();
                var country  = _countryController.text.toString();

                Map<String, String> jsonInput = {
                  "title":title,
                  "name":name,
                  "mobile":mobile,
                  "alternate_mobile":"",
                  "address_line1":address1,
                  "address_line2":address2,
                  "locality":locality,
                  "landmark":landmark,
                  "pincode":pincode,
                  "city":city,
                  "state":state,
                  "country":country,
                  "latitude":"",
                  "longitude":""
                };

                bool saveData = true;

                if(address1.isEmpty){
                  saveData = false;
                  Fluttertoast.showToast(msg: "Please Enter Address Line 1");
                  return;
                }

                if(city.isEmpty){
                  saveData = false;
                  Fluttertoast.showToast(msg: "Please Enter City");
                  return;
                }

                if(pincode.isEmpty){
                  saveData = false;
                  Fluttertoast.showToast(msg: "Please Enter Pincode");
                  return;
                }

                if(state.isEmpty){
                  saveData = false;
                  Fluttertoast.showToast(msg: "Please Enter State");
                  return;
                }

                if(country.isEmpty){
                  saveData = false;
                  Fluttertoast.showToast(msg: "Please Enter Country");
                  return;
                }


                if(saveData){
                  _setBookingFormData(jsonInput);
                }




              },
              loading: isLoading,
              text: 'Save Address',
             // loading: _loading,
            )
          ],
        ),
      ),
    );
  }
}
