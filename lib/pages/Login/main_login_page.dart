import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/Login/login_page_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageBody(),
    );
  }
}
