import 'package:flutter/material.dart';

import 'khalti_payment_page_body.dart';

class KhaltiPayment extends StatefulWidget {
  const KhaltiPayment({Key? key}) : super(key: key);

  @override
  State<KhaltiPayment> createState() => _KhaltiPaymentState();
}

class _KhaltiPaymentState extends State<KhaltiPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pay Via'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: KhaltiPaymentPageBody(),
    );
  }
}
