import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/auth/user/user.dart';
import 'package:lunaaz_moto/models/customer/booking_model/booking_model.dart';
import 'package:lunaaz_moto/models/customer/user_address_model/user_address_model.dart';
import 'package:lunaaz_moto/models/service_center/service_center_list_main_model.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:lunaaz_moto/models/user_addressModel/user_address_model.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/addresses/add_address_screen.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_services.dart';
import 'package:lunaaz_moto/services/api_service.dart';
import 'package:lunaaz_moto/services/shared_preferences_service.dart';

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
  List<Addresses>? _addressList;
  int? addressId = 0;
  String? address = "";
 Position? _currentPosition;

  bool isLoading = true;

  final TextEditingController _vehicNameController =       TextEditingController();
  final TextEditingController _phoneController =      TextEditingController();
  final TextEditingController _serviceDateController = TextEditingController();
  final TextEditingController _serviceTimeController   = TextEditingController();
  final TextEditingController _vehicleNumController     = TextEditingController();
  final TextEditingController _addressController        =     TextEditingController();

  bool _showAddresses = false;
  bool _validate = false;
  var isDisabled = true;

  @override
  void initState() {
    _serviceTimeController.text = "";
    _serviceDateController.text = "";
    _radioSelected  = 2;

    //_phoneController.text = _userMob!.mobile = "";

    _addressController.text = "";




    super.initState();
    getServiceCenterListFromApi();
    getProfileData();

  }

  getServiceCenterListFromApi() async{
    AuthAddress _userAddress = await ApiService.getAddressListD();
    print("object>>>>>${jsonEncode(_userAddress)}");
    if(_userAddress.status != null){
      print("hhhh123546>>>");
      _addressList = _userAddress.addresses;

      setState(() {
        isLoading = false;
      });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }




  getProfileData() async{




    var userData =  await SharedPreferencesService.getAuthUserData();
    setState(() {
      _userMob = userData;
      _phoneController.text = _userMob != null ? _userMob!.mobile ?? "" : "";
    });
  }

  void _setBookingFormData(Map<String, String> jsonInput) async {



    isLoading = true;

    BookingModel bookingModel = await ApiService.setBookingForm(jsonInput: jsonEncode(jsonInput));

    print("booking form data>>>>>${jsonEncode(bookingModel)}>>>>");


    if(bookingModel.status  == "success"){
      isLoading = false;
      setState(() {
        Navigator.of(context)
            .pushReplacementNamed(MyServicesScreen.routeName);
     // Navigator.pushNamed(context, MyServicesScreen.routeName);
      });
    }





}

  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {

    showDatePicker(
      currentDate: DateTime.now(),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2060),
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



  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }


  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // Group Value for Radio Button.
  int id = 1;



  @override
  Widget build(BuildContext context) {


    final packageId = ModalRoute.of(context)?.settings.arguments as int;

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
          child: const Icon(Icons.arrow_back)
          ,),
        title: const Text("Booking Information",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50,),
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
                        const SizedBox(height: 15,),
                        const Text("Bike Service or Car Wash",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800
                        ),),
                        const SizedBox(height: 20,),
                        const SizedBox(height: 10,),
                        const Text("Vehicle Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
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

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon:

                          const Icon(
                            Icons.car_repair,
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
                        const SizedBox(height: 25,),
                        const Text("Phone Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 25,),
                        const Text("Service Date",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 25,),
                        const Text("Service Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 25,),
                        const Text("Vehicle Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
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
                        const SizedBox(height: 25,),
                        Row(
                          children: [
                            const Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            Spacer(),
                           InkWell(
                             onTap: (){
                               Navigator.pushNamed(context, AddAddressScreen.routeName);
                             },
                             child: Row(children: [
                               Icon(Icons.my_location,color: Color(0xffc40000),),
                               SizedBox(width: 6,),
                               Text("Add",style: TextStyle(color: Color(0xffc40000),fontSize: 23,fontWeight: FontWeight.w700),)
                             ],),
                           ),
                          ],
                        ),
                        const SizedBox(height: 18,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showAddresses = true;
                            });
                          },
                          child: Container(
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
                              enabled: false,
                              controller: _addressController,
                              decoration: InputDecoration(

                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.location_pin,
                                  color: Color(0xffc40000),
                                ),
                                hintText: 'Select Your Address',

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
                        ),


                        const SizedBox(height: 20,),
                        const Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("We Accept only COD",style: TextStyle(color: Colors.red,fontSize: 17),),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

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
                              ),
                              Text('Cash On Delivery'),
                              Spacer(),
                              Text('Online Cash'),
                              Radio(
                                toggleable: false,
                                value: 1,
                                groupValue: _radioSelected,
                                activeColor: Colors.blue,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _radioSelected = value as int;
                                  //   _radioVal  = 'Online Cash';
                                  // });
                                },
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
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
                                "package_id": packageId.toString(),
                                "booked_date": serviceDate,
                                "booked_time": serviceTime,
                                "vehicle_type":"two_wheeler",
                                "vehicle_name": vehicleName,
                                "vehicle_number": vehicleNum,
                                "instructions":"instructions",
                                "payment_method":_radioSelected.toString(),
                                "payment_details":"",
                                "payment_status":"due",
                                "user_address": addressId.toString(),
                            };

                            bool saveData = true;

                            if(vehicleName.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Vehicle Name");
                               return;
                            }

                            if(phoneNumber.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Phone Number");
                              return;
                            }

                            if(serviceDate.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Date");
                              return;
                            }

                            if(serviceTime.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Time");
                              return;
                            }

                            if(vehicleNum.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Vehicle Number");
                              return;
                            }

                            // if(address.isEmpty){
                            //   saveData = false;
                            //   Fluttertoast.showToast(msg: "Please Enter Address");
                            //   return;
                            // }

                            if(saveData){
                              _setBookingFormData(jsonInput);
                            }

                            print("object${saveData}");

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
          _showAddresses
              ? Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.black87,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(color: CustomColor.whiteColor,borderRadius: BorderRadius.circular(14)),
                child: ListView.builder(
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: _addressList?.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: (){
                          setState(() {
                            _showAddresses = false;
                          });
                          addressId = _addressList![index].id;
                          address =  _addressList![index].fullAddress;
                          _addressController.text = address!;

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                width:270,
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffffecec),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        _addressList != null?
                                    Text(
                                      "${_addressList![index].addressLine1},"
                                          "${_addressList![index].addressLine2},"
                                          "${_addressList![index].locality},"
                                          "${_addressList![index].landmark},"
                                          "${_addressList![index].city},"
                                          "${_addressList![index].pincode},"
                                          "\n${_addressList![index].state},"
                                          "${_addressList![index].country}."
                                      ,style: TextStyle(),): Text("No Address")
                                  )
                              ),
                              SizedBox(width: 6,),
                              Container(
                                decoration: BoxDecoration(color: CustomColor.primaryColor,borderRadius: BorderRadius.circular(14)),
                                  child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Select",style: TextStyle(fontSize: 14,color: CustomColor.whiteColor),),
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// userType = _userTypes[index];
//TextSpan(text: _addressList![index].city),



