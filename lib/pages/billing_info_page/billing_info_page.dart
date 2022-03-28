import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/billing_info_page/billing_info_page_body.dart';

class BillingInfoPage extends StatefulWidget {
  const BillingInfoPage({Key? key}) : super(key: key);

  @override
  _BillingInfoPageState createState() => _BillingInfoPageState();
}

class _BillingInfoPageState extends State<BillingInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BillingInfoPageBody(),
    );
  }
}
