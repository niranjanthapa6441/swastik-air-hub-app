import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';

import '../../utils/dimesions/dimesions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class ShowAvailableTicketsPageBody extends StatefulWidget {
  const ShowAvailableTicketsPageBody({Key? key}) : super(key: key);

  @override
  _ShowAvailableTicketsPageBodyState createState() =>
      _ShowAvailableTicketsPageBodyState();
}

class _ShowAvailableTicketsPageBodyState
    extends State<ShowAvailableTicketsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(
            top: Dimensions.height20,
            left: Dimensions.width10,
            right: Dimensions.width10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "From:",
                    size: 16,
                  ),
                  BigText(
                    text: "Kathmandu",
                    size: 16,
                  ),
                ],
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color.fromARGB(169, 46, 38, 196),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: "27",
                      color: Color.fromARGB(255, 237, 237, 238),
                    ),
                    BigText(
                      text: "Feburary",
                      color: Color.fromARGB(255, 238, 237, 237),
                    ),
                    BigText(
                      text: "2022",
                      color: Color.fromARGB(255, 238, 237, 237),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigText(text: "To:", size: 16),
                  BigText(text: "Pokhara", size: 16),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width10,
          ),
          child: Row(
            children: [BigText(text: "Showing Available Flights")],
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        Container(
          height: 600,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Get.toNamed(RouteHelper.recommendedFood);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(169, 46, 38, 196)),
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      //imageContainer
                      Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10,
                            bottom: Dimensions.height10,
                            top: Dimensions.height10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(169, 46, 38, 196),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                              text: "27",
                              color: Color.fromARGB(255, 237, 237, 238),
                            ),
                            BigText(
                              text: "Feburary",
                              color: Color.fromARGB(255, 238, 237, 237),
                            ),
                            BigText(
                              text: "2022",
                              color: Color.fromARGB(255, 238, 237, 237),
                            )
                          ],
                        ),
                      ),
                      //textContainer
                      Expanded(
                        child: Container(
                          width: 230,
                          height: 150,
                          margin: EdgeInsets.only(
                              right: Dimensions.width5,
                              top: Dimensions.height10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Booking Id:",
                                color: Color.fromARGB(169, 46, 38, 196),
                                size: 18,
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              BigText(
                                text: "Sector:",
                                color: Color.fromARGB(169, 46, 38, 196),
                                size: 18,
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              BigText(
                                text: "Departure Time:",
                                color: Color.fromARGB(169, 46, 38, 196),
                                size: 18,
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              BigText(
                                text: "Status:",
                                color: Color.fromARGB(169, 46, 38, 196),
                                size: 18,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteHelper.getConfrimDetail());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SmallText(
                                      text: "Book Tickets",
                                      color: AppColors.mainBlackColor,
                                      size: 13.5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.mainBlackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    ;
  }
}
