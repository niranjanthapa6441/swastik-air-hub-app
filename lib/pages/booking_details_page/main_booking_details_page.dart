import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route_helper/route_helper.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.initial);
            },
            child: Icon(Icons.arrow_back)),
        title: const Text('Booking Details'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
    );
  }
}
