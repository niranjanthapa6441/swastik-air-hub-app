import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route_helper/route_helper.dart';
import 'notification_page_body.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationBody(),
    );
  }
}
