import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/search_flight_page/components/date_time_picker.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/app_button.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import 'input_fields.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBody> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
          bottom: Dimensions.height10,
          top: Dimensions.height10,
          left: Dimensions.width30,
          right: Dimensions.width30),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Departure Date:",
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SearchFields(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Sector:",
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SearchFields(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Number of Traveller:",
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      SearchFields(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDateTimePicker(),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.availableFlightsAndTickets);
                  },
                  child: AppButton(
                    btn_txt: "Search Flight",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
