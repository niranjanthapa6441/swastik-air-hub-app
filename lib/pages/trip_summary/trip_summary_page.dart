import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/trip_summary/trip_summary_page_body.dart';

class TripSummaryPage extends StatefulWidget {
  const TripSummaryPage({Key? key}) : super(key: key);

  @override
  _TripSummaryPageState createState() => _TripSummaryPageState();
}

class _TripSummaryPageState extends State<TripSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Summary'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: TripSummaryPageBody(),
    );
  }
}
