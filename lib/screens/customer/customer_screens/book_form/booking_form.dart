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
  List<Address>? _addressList;
  int? addressId = 0;
  String? address = "";
 Position? _currentPosition;
 var endDate = "";

  bool isLoading = false;

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
   setState(() {
     isLoading = true;
   });
    AuthAddress _userAddress = await ApiService.getAddressListD();
    print("object>>>>>${jsonEncode(_userAddress)}");
    if(_userAddress.status != null){
      print("hhhh123546>>>");
      setState(() {
        isLoading = false;
        _addressList = _userAddress.  addresses;
      });



    }else{

    }
  }




  getProfileData() async{




    var userData =  await SharedPreferencesService.getAuthUserData();
    setState(() {
      _userMob = userData;
      _phoneController.text = _userMob != null ? _userMob!.mobile ?? "" : "";
    });
  }

  bool isLoader = true;

  void _setBookingFormData(Map<String, String> jsonInput) async {




    BookingModel bookingModel = await ApiService.setBookingForm(jsonInput: jsonEncode(jsonInput));

    print("booking form data>>>>>${jsonEncode(bookingModel)}>>>>");


    if(bookingModel.status  == "success"){

      setState(() {
        Navigator.of(context)
            .pushReplacementNamed(MyServicesScreen.routeName);
     // Navigator.pushNamed(context, MyServicesScreen.routeName);
      });
    }





}

  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {

    int year = 0;
    int month= 0;
    int day= 0;
    if(endDate != "0"){
      var parts = endDate.split('-');
      year = int.parse(parts[2]);
      month = int.parse(parts[1]);
      day = int.parse(parts[0]);
    }
    else{
      year = 2060;
      month = 12;
      day = 31;
    }

    showDatePicker(
      currentDate: DateTime.now(),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(year, month,day),
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
        //print("time>>>>>${value?.hour}-${value?.minute}-${value?.periodOffset}");
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




  int id = 1;




  @override
  Widget build(BuildContext context) {


    Map<String, dynamic> argsPackage = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var packageId = argsPackage['packageId'];
    var vehicleType = argsPackage['vehicleType'];
    endDate = argsPackage['packageExpiryDate'];
    print("pId>>>>${packageId}>>>>${vehicleType}>>>>${endDate}");
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
          child: const Icon(Icons.arrow_back)),
        title: const Text("Booking Information",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :  Stack(
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
                        vehicleType != 'four_wheeler' ?
                        Text("Bike Service",style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800
                        ),):
                        Text("Car Wash",style: TextStyle(
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

                              vehicleType == 'four_wheeler' ?
                              Icon(
                                Icons.car_crash_sharp,
                                color: Color(0xffc40000),
                              ):Icon(Icons.directions_bike,color: Color(0xffc40000)),
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
                            boxShadow: const [
                               BoxShadow(
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
                              suffixIcon:
                              vehicleType != 'four_wheeler' ?
                              const Icon(
                                Icons.pedal_bike,
                                color: Color(0xffc40000),
                              ):Icon(
                                Icons.car_crash,
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
                                Navigator.pushNamed(context, AddAddressScreen.routeName).then((value) {
                                  Address userAddress = value as Address;
                                  setState(() {
                                    addressId = userAddress.id;
                                    _addressController.text = userAddress.fullAddress ?? "";


                                  });
                                });
                              },
                              child:   Icon(Icons.add,color: Color(0xffc40000),),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18,),
                        InkWell(
                          onTap: () {
                            _addressNullNavigate();
                          },
                          child: Container(
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
                        Text("We Accept only COD",style: TextStyle(color: Colors.red,fontSize: 17),),
                        const SizedBox(height: 10,),
                        Row(
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
                            Text('Online Cash'),


                          ],
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
                              "user_address_id": addressId.toString(),
                              "package_id": packageId.toString(),
                              "booked_date": serviceDate,
                              "booked_time": serviceTime,
                              "vehicle_type":vehicleType,
                              "vehicle_name": vehicleName,
                              "vehicle_number": vehicleNum,
                              "instructions":"instructions",
                              "payment_method":_radioSelected.toString(),
                              "payment_details":"",
                              "payment_status":"due",
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

                            if(address.isEmpty){
                              saveData = false;
                              Fluttertoast.showToast(msg: "Please Enter Address");
                              return;
                            }

                            if(saveData){
                              _setBookingFormData(jsonInput);
                            }

                           // print("object${saveData}");

                            //print("object>>>>${_radioVal.toString()}>>>>");

                            //print("mapp>>>>>>>>>>&&&>>${jsonEncode(jsonInput)}>>>>>>>>>>>>");


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
                child:

                ListView.builder(
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
                                  width:screenSize.width / 2,
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffffecec),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:

                                    Text(
                                      "${_addressList![index].addressLine1},"
                                          "${_addressList![index].addressLine2},"
                                          "${_addressList![index].locality},"
                                          "${_addressList![index].landmark},"
                                          "${_addressList![index].city},"
                                          "${_addressList![index].pincode},"
                                          "\n${_addressList![index].state},"
                                          "${_addressList![index].country}."
                                      ,style: TextStyle(),),
                                  )
                              ),
                              SizedBox(width: 3,),
                              Container(
                                decoration: BoxDecoration(color: CustomColor.primaryColor,borderRadius: BorderRadius.circular(14)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Select",style: TextStyle(fontSize: 14,color: CustomColor.whiteColor),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ) :
          const SizedBox(),


        ],
      ),
    );
  }

  void _addressNullNavigate() {

    print("addrelistr>>>>>>${jsonEncode(_addressList)}");
    if(_addressList != null){
      setState(() {
        _showAddresses = true;
      });
    }
    else{
      Navigator.pushNamed(context, AddAddressScreen.routeName).then((value) {
        Address userAddress = value as Address;
        setState(() {
          addressId = userAddress.id;
          _addressController.text = userAddress.fullAddress ?? "";

        });
      });
    }

  }

}

// userType = _userTypes[index];
//TextSpan(text: _addressList![index].city),



