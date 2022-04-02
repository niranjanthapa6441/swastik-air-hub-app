import 'package:flutter/material.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../utils/dimesions/dimesions.dart';

class FlightTicketDetailPageBody extends StatefulWidget {
  const FlightTicketDetailPageBody({Key? key}) : super(key: key);

  @override
  State<FlightTicketDetailPageBody> createState() =>
      _FlightTicketDetailPageBodyState();
}

class _FlightTicketDetailPageBodyState
    extends State<FlightTicketDetailPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: Dimensions.height35 * 18,
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height30,
                top: Dimensions.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Color.fromARGB(220, 234, 235, 233),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width30 + Dimensions.width30,
                right: Dimensions.width30 + Dimensions.width30,
              ),
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.purpleColor,
              ),
              child: Center(
                child: BigText(
                  text: "Book Flight",
                  size: Dimensions.font30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
