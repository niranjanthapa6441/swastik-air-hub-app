import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/show_payment_method/show_payment_page_body.dart';

class ShowAvailablePaymentMethods extends StatefulWidget {
  const ShowAvailablePaymentMethods({Key? key}) : super(key: key);

  @override
  State<ShowAvailablePaymentMethods> createState() =>
      _ShowAvailablePaymentMethodsState();
}

class _ShowAvailablePaymentMethodsState
    extends State<ShowAvailablePaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pay Via'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: ShowAvailablePaymentMethodsPageBody(),
    );
  }
}
