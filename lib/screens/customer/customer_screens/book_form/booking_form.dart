import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lunaaz_moto/common/widgets/custom_button.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/screens/customer/customer_screens/my_services/my_services.dart';

class BookingForm extends StatefulWidget {
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

  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _dateTime = value!;
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
                    Row(children: <Widget> [
                      Text("Select Type :-",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),),

                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'ONE';
                            id = 1;
                          });
                        },
                      ),
                      Text(
                        'Car',
                        style: new TextStyle(fontSize: 17.0),
                      ),

                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'TWO';
                            id = 2;
                          });
                        },
                      ),
                      const Text('Bike', style:  TextStyle(
                          fontSize: 17.0,
                        ),
                      ),


                    ],),
                    SizedBox(height: 10,),
                    Text("Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextFormField(
                    obscureText: true,
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
                            color: Colors.grey,
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        obscureText: true,
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
                            color: Colors.grey,
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        controller: _serviceDateController,
                        obscureText: true,
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
                          setState(() {
                            _serviceDateController.text = _dateTime.toString();
                          });
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
                            color: Colors.grey,
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        obscureText: true,
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
                            color: Colors.grey,
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        obscureText: true,
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
                            color: Colors.grey,
                            blurRadius: 20,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextFormField(
                        obscureText: true,
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
                        // onTap: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyServicesScreen()));
                        // },
                      onTap: () async {


                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyServicesScreen(),),);
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




