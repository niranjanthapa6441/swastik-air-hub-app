import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/view_booking_detail/booking_detail_page_body.dart';

import '../../route_helper/route_helper.dart';

class BookingDetail extends StatefulWidget {
  const BookingDetail({Key? key}) : super(key: key);

  @override
  _BookingDetailState createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.bookingDetails);
            },
            child: Icon(Icons.arrow_back)),
        title: const Text('Booking Detail'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: BookingDetailBody(),
    );
  }
}
