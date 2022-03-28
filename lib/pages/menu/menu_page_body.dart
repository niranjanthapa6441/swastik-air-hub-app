import 'package:flutter/material.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

class MenuPageBody extends StatefulWidget {
  const MenuPageBody({Key? key}) : super(key: key);

  @override
  _MenuPageBodyState createState() => _MenuPageBodyState();
}

class _MenuPageBodyState extends State<MenuPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: BigText(text: "Menu"),
      ),
    );
  }
}
