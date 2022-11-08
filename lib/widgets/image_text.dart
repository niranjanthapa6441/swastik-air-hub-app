import 'package:flutter/material.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

class ImageAndTextWidget extends StatelessWidget {
  final String imageURl;
  final String text;
  const ImageAndTextWidget(
      {Key? key, required this.imageURl, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.height10 * 12,
          height: Dimensions.height10 * 12,
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white38,
            image: DecorationImage(
              image: AssetImage(imageURl),
            ),
          ),
        ),
        SizedBox(
          width: Dimensions.width20 * 3,
        ),
        BigText(
            text: text, size: Dimensions.font20, color: AppColors.textColor),
      ],
    );
  }
}
