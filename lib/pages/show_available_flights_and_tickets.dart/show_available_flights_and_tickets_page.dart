import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/show_available_flights_and_tickets.dart/show_available_tickets_flight_page_body.dart';

import '../../route_helper/route_helper.dart';

class ShowAvailableFlightsAndTickets extends StatefulWidget {
  const ShowAvailableFlightsAndTickets({Key? key}) : super(key: key);

  @override
  _ShowAvailableFlightsAndTicketsState createState() =>
      _ShowAvailableFlightsAndTicketsState();
}

class _ShowAvailableFlightsAndTicketsState
    extends State<ShowAvailableFlightsAndTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Available Flights'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: ShowAvailableTicketsPageBody(),
    );
  }
}
