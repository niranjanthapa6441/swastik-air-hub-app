import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/show_available_payment_methods/show_available_payment_methods_body.dart';

class ShowAvailablePaymentMethod extends StatefulWidget {
  const ShowAvailablePaymentMethod({Key? key}) : super(key: key);

  @override
  State<ShowAvailablePaymentMethod> createState() =>
      _ShowAvailablePaymentMethodState();
}

class _ShowAvailablePaymentMethodState
    extends State<ShowAvailablePaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pay Via'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: ShowAvailablePaymentMethodPageBody(),
    );
  }
}
