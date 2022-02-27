import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/homepage/home_page_body.dart';
import 'package:swastik_air_hub/widgets/button_navigation_bar.dart';

import '../../route_helper/route_helper.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(RouteHelper.getViewNotiifcations());
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Get.toNamed(RouteHelper.getMenu());
            },
          ),
        ],
      ),
      body: HomePageBody(),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
