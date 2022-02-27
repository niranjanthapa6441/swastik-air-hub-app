import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/menu/menu_page_body.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuPageBody(),
    );
  }
}
