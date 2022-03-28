import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page_body.dart';

class DetailConfirmationPage extends StatefulWidget {
  const DetailConfirmationPage({Key? key}) : super(key: key);

  @override
  _DetailConfirmationPageState createState() => _DetailConfirmationPageState();
}

class _DetailConfirmationPageState extends State<DetailConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailConfirmationPageBody(),
    );
  }
}
