import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/search_flight_page/search_flight_page_body.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/widgets/button_navigation_bar.dart';

class SeacrhFlightPage extends StatefulWidget {
  const SeacrhFlightPage({Key? key}) : super(key: key);

  @override
  _SeacrhFlightPageState createState() => _SeacrhFlightPageState();
}

class _SeacrhFlightPageState extends State<SeacrhFlightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.initial);
            },
            child: Icon(Icons.arrow_back)),
        title: const Text('Search'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: SearchFlightPageBody(),
    );
  }
}
