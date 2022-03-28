import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/Registration/registration_body.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegistrationPageBody(),
    );
  }
}
