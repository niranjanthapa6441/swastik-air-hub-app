import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route_helper/route_helper.dart';
import 'flight_ticket_detail_page_body.dart';

class FlightTIcketDetailPage extends StatelessWidget {
  int pageId;
  FlightTIcketDetailPage({required this.pageId, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getAvailableFlightsAndTickets());
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: 30,
          ),
        ),
        title: const Text('Flight Detail'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: FlightTicketDetailPageBody(
        pageId: pageId,
      ),
    );
  }
}
