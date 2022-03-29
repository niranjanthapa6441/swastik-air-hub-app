import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/sign_up_page/sign_up_page_body.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpPageBody(),
    );
  }
}
