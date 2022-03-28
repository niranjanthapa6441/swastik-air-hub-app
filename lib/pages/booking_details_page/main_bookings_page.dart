import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/booking_details_page/bookings_page_body.dart';

import '../../route_helper/route_helper.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.initial);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: 30,
          ),
        ),
        title: const Text('Booking Details'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: BookingsBody(),
    );
  }
}
