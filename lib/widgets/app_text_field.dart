import 'package:flutter/material.dart';

import '../utils/Color/colors.dart';
import '../utils/dimesions/dimesions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  final bool readOnly;
  Widget? widget;
  AppTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.icon,
      this.isObscure = false,
      this.readOnly = false,
      this.widget = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                spreadRadius: 6,
                offset: Offset(1, 8),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: Row(
        children: [
          widget == null
              ? Container()
              : Container(
                  child: widget,
                ),
          Expanded(
            child: TextFormField(
              readOnly: readOnly,
              obscureText: isObscure ? true : false,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: widget == null
                    ? Icon(
                        icon,
                        color: AppColors.purpleColor,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide(width: 1.0, color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  borderSide: BorderSide(width: 1.0, color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
