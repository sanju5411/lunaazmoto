import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}
final _formKey = GlobalKey<FormState>();

     TextEditingController nameController = TextEditingController();
     TextEditingController mobileController = TextEditingController();
     TextEditingController addressLine1Controller = TextEditingController();
     TextEditingController addressLine2Controller = TextEditingController();
     TextEditingController localityController = TextEditingController();
     TextEditingController landmarkController = TextEditingController();
     TextEditingController cityController = TextEditingController();
     TextEditingController pinCodeController = TextEditingController();
     TextEditingController stateController = TextEditingController();
     TextEditingController countryController = TextEditingController();

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
