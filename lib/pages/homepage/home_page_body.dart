import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.bookingDetails);
              },
              child: Container(
                margin: EdgeInsets.all(25),
                child: Text("Click to view Booking Details"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
