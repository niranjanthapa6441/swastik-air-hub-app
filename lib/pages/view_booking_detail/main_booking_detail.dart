import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/view_booking_detail/booking_detail_page_body.dart';

import '../../route_helper/route_helper.dart';

class BookingDetail extends StatelessWidget {
  int pageId;
  BookingDetail({required this.pageId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Booking Detail'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: BookingDetailPageBody(pageId: pageId),
    );
  }
}
