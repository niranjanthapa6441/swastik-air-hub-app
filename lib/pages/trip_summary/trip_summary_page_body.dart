import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../../utils/Color/colors.dart';
import '../../utils/dimesions/dimesions.dart';
import '../../widgets/big_text.dart';

class TripSummaryPageBody extends StatefulWidget {
  const TripSummaryPageBody({Key? key}) : super(key: key);

  @override
  _TripSummaryPageBodyState createState() => _TripSummaryPageBodyState();
}

class _TripSummaryPageBodyState extends State<TripSummaryPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height10),
            width: Dimensions.width30 * 15,
            child: BigText(text: "Detail"),
          ),
          Container(
            height: Dimensions.height35 * 7.8,
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
                top: Dimensions.height10),
            width: Dimensions.width30 * 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Color.fromARGB(220, 234, 235, 233),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height15,
                  top: Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Departure Date: ",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Departure Time: ",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "From: " + AppConstants.FROM,
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "To: " + AppConstants.To,
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Arrival Time: ",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Duration: ",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            width: Dimensions.width30 * 15,
            child: BigText(text: "Fare Summary"),
          ),
          Container(
            height: Dimensions.height35 * 9.25,
            margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
                top: Dimensions.height10),
            width: Dimensions.width30 * 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Color.fromARGB(220, 234, 235, 233),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height15,
                  top: Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Age Group",
                        ),
                        BigText(
                          text: "Number",
                        ),
                        BigText(
                          text: "Price",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Adult",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "1700",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Child",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "200",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "PSC(Airport Tax)",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "200",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Child Discount",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "100",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Adult Discount",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "100",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: "Total",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "4",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: "1700",
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.availablePaymentMethods);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width30 + Dimensions.width30,
                right: Dimensions.width30 + Dimensions.width30,
              ),
              height: Dimensions.screenHeight / 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.purpleColor,
              ),
              child: Center(
                child: BigText(
                  text: "Continue",
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
