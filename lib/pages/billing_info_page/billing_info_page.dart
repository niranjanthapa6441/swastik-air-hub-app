import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/billing_info_page/billing_info_page_body.dart';

class BillingInfoPage extends StatefulWidget {
  const BillingInfoPage({Key? key}) : super(key: key);

  @override
  _BillingInfoPageState createState() => _BillingInfoPageState();
}

class _BillingInfoPageState extends State<BillingInfoPage> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Payment Details'),
          backgroundColor: Color.fromARGB(169, 46, 38, 196),
        ),
        body: BillingInfoPageBody(),
      ),
      onWillPop: () async {
        return false;
      });
}
