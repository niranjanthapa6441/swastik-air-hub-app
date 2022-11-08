import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/flight_controller.dart';
import 'package:swastik_air_hub/model/search_flight_response.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/widgets/icon_and_text_widget.dart';

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
  String dropdownValue = '';
  bool sectorSelection = false;
  bool filterValue = false;
  List<String> sortBy = ['Low to High Price', 'High to Low Price'];
  @override
  void initState() {
    super.initState();
  }

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
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigText(
                    text: AppConstants.FROM,
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
                      text: AppConstants.FLIGHT_DATE,
                      color: Color.fromARGB(255, 237, 237, 238),
                    ),
                    // BigText(
                    //   text: "Feburary",
                    //   color: Color.fromARGB(255, 238, 237, 237),
                    // ),
                    // BigText(
                    //   text: "2022",
                    //   color: Color.fromARGB(255, 238, 237, 237),
                    // )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BigText(text: "To:", size: 16),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigText(text: AppConstants.To, size: 16),
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
            right: Dimensions.width10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Dimensions.width30 * 8,
                child: BigText(text: "Available Flights"),
              ),
              Container(
                width: Dimensions.width30 * 4,
                child: DropdownButton<String>(
                  elevation: 16,
                  style: TextStyle(color: AppColors.mainBlackColor),
                  underline: null,
                  icon: null,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      sectorSelection = true;
                      _changeFilterValue(newValue);
                    });
                  },
                  items: sortBy.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: sectorSelection
                      ? Text(dropdownValue.toString())
                      : IconAndTextWidget(
                          icon: Icons.sort,
                          text: 'Sort By',
                          iconColor: AppColors.purpleColor),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),
        GetBuilder<FlightController>(
          builder: (availableFlights) {
            return Container(
              margin: EdgeInsets.only(
                top: Dimensions.width5,
              ),
              height: 570,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: availableFlights.availableFlightsLowToHigh.isEmpty
                    ? 0
                    : availableFlights.availableFlightsLowToHigh.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: filterValue
                        ? _buildCustomerBookingDetailItemPage(
                            index,
                            fromHighToLowPrice(availableFlights
                                .availableFlightsLowToHigh)[index])
                        : _buildCustomerBookingDetailItemPage(
                            index,
                            fromLowtoHigh(availableFlights
                                .availableFlightsLowToHigh)[index]),
                  );
                },
              ),
            );
          },
        ),
        //imageContainer
      ],
    );
    ;
  }

  Widget _buildCustomerBookingDetailItemPage(
      int index, SearchFlightModel searchFlightModel) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Color.fromARGB(220, 239, 240, 238),
      ),
      child: Row(
        children: [
          //textContainer
          Expanded(
            child: Container(
              width: 230,
              height: 150,
              margin: EdgeInsets.only(
                  right: Dimensions.width5,
                  left: Dimensions.width10,
                  top: Dimensions.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Company Name: " +
                        searchFlightModel.companyName.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigText(
                    text: "Flight Code: " +
                        searchFlightModel.flightCode.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  BigText(
                    text: "Departure Time: " +
                        searchFlightModel.departureTime.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigText(
                    text: "Ticket Price: " +
                        searchFlightModel.ticket!.price.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get.toNamed(RouteHelper.getViewBookingDetail());
                      Get.toNamed(RouteHelper.getFlightTicketDetail(index));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallText(
                          text: "View Details",
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
          ),
        ],
      ),
    );
  }

  void _changeFilterValue(String newValue) {
    if (newValue == 'Low to High Price') {
      filterValue = false;
    } else if (newValue == 'High to Low Price') {
      filterValue = true;
    }
  }

  List<dynamic> fromHighToLowPrice(List<dynamic> flightList) {
    int n = flightList.length;
    SearchFlightModel temp = new SearchFlightModel();
    if (flightList != null) {
      for (int i = 0; i < n; i++) {
        for (int j = 1; j < (n - i); j++) {
          if (flightList[j - 1].ticket!.price! < flightList[j].ticket!.price!) {
            temp = flightList[j - 1];
            flightList[j - 1] = flightList[j];
            flightList[j] = temp;
          }
        }
      }
    }
    flightList;
    return flightList;
  }

  List<dynamic> fromLowtoHigh(List<dynamic> flightList) {
    int n = flightList.length;
    SearchFlightModel temp = new SearchFlightModel();
    if (flightList != null) {
      for (int i = 0; i < n; i++) {
        for (int j = 1; j < (n - i); j++) {
          if (flightList[j - 1].ticket!.price! > flightList[j].ticket!.price!) {
            temp = flightList[j - 1];
            flightList[j - 1] = flightList[j];
            flightList[j] = temp;
          }
        }
      }
    }
    flightList;
    return flightList;
  }
}
