import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/sign_in_page/sign_in_page_body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
          body: SignInPageBody(),
        ),
        onWillPop: () async {
          return false;
        },
      );
}
