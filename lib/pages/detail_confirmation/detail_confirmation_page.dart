import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page_body.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';

class DetailConfirmationPage extends StatefulWidget {
  const DetailConfirmationPage({Key? key}) : super(key: key);

  @override
  _DetailConfirmationPageState createState() => _DetailConfirmationPageState();
}

class _DetailConfirmationPageState extends State<DetailConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Confirmation'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: DetailConfirmationPageBody(),
    );
  }
}
