import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/profilepage/profile_page_body.dart';
import 'package:swastik_air_hub/widgets/button_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Profile'),
          backgroundColor: Color.fromARGB(169, 46, 38, 196),
        ),
        body: ProfilePageBody(),
      ),
      onWillPop: () async {
        return false;
      });
}
