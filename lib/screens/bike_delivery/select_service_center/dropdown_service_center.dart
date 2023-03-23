import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';
import 'package:lunaaz_moto/models/customer/service/service_model.dart';
import 'package:lunaaz_moto/models/service_center/service_centers.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ServiceCenterDropDown extends StatefulWidget {
  static const String routeName = '/select_dropdown_menu';

  const ServiceCenterDropDown({Key? key}) : super(key: key);



  @override
  State<ServiceCenterDropDown> createState() => _ServiceCenterDropDownState();
}
  ServiceCenters? _service_list;



class _ServiceCenterDropDownState extends State<ServiceCenterDropDown> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: Text("Select Service Center",style: TextStyle(color: CustomColor.whiteColor),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined),
        ),
        elevation: 0,
        backgroundColor: CustomColor.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),)
          ),
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const Text('Select Your Service Center',style: TextStyle(color: CustomColor.primaryColor,fontSize: 23,fontWeight: FontWeight.w700), ),
                const SizedBox(
                height: 20,
              ),
              MultiSelectDropDown(
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                  options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 660', value: '6'),
                ],
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(
                    wrapType: WrapType.wrap, backgroundColor: Colors.red),
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(
                  Icons.checklist,
                  color: Colors.pink,
                ),
                selectedOptionTextColor: Colors.blue,
              ),
              const SizedBox(
                height: 50,
              ),

            ],),
          )
        ),
      ),
    );
  }
}
// MultiSelectDropDown(
// onOptionSelected: (List<ValueItem> selectedOptions) {
//
// },
// options: const <ValueItem>[
// ValueItem(label: 'The Bike Repair', value: '1'),
// ValueItem(label: 'Bike Pro', value: '2'),
// ValueItem(label: 'Lunaaz Moto', value: '3'),
// ValueItem(label: 'Evergreen Home Bike', value: '4'),
// ValueItem(label: 'Bike’s Corner', value: '5'),
// ValueItem(label: 'Think Smart', value: '6'),
// ],
// selectionType: SelectionType.single,
// chipConfig: const ChipConfig(wrapType: WrapType.wrap),
// dropdownHeight: screenSize.height,
// optionTextStyle: const TextStyle(fontSize: 16),
// selectedOptionIcon: const Icon(Icons.check_circle),
// ),