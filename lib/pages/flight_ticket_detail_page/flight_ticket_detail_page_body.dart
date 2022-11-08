import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/flight_controller.dart';
import 'package:swastik_air_hub/model/search_flight_response.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../route_helper/route_helper.dart';
import '../../utils/dimesions/dimesions.dart';
import '../../widgets/small_text.dart';

class FlightTicketDetailPageBody extends StatelessWidget {
  int pageId;
  FlightTicketDetailPageBody({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchFlightModel flightTicketDetail =
        Get.find<FlightController>().availableFlightsLowToHigh[pageId];
    print(pageId);
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
            width: Dimensions.width30 * 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Color.fromARGB(220, 234, 235, 233),
            ),
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height30,
                  top: Dimensions.height30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Company Name: " +
                        flightTicketDetail.companyName.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Flight Code: " +
                        flightTicketDetail.flightCode.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Fleet: " + "ATR-372",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Departure Date: " +
                        flightTicketDetail.departureDate.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Departure Time: " +
                        flightTicketDetail.departureTime.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "From: " + flightTicketDetail.sector!.from.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "To: " + flightTicketDetail.sector!.to.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Sector Code: " +
                        flightTicketDetail.sector!.sectorCode.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Duration: " +
                        flightTicketDetail.sector!.duration.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Baggage: " + "25 kg",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Class: " + "Y",
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Ticket Price: " +
                        flightTicketDetail.ticket!.price.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Status: " + flightTicketDetail.status.toString(),
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getConfrimDetail());
              _setTicketCode(flightTicketDetail.ticket!.ticketCode.toString());
              _setFlightCode(flightTicketDetail.flightCode.toString());
              _setDuration(flightTicketDetail.sector!.duration.toString());
              _setDepartureTime(flightTicketDetail.departureTime.toString());
              _setTotalTicketPrice(flightTicketDetail.ticket!.price.toString());
            },
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

  void _setTicketCode(String ticketCode) {
    AppConstants.TICKET_CODE = ticketCode;
  }

  void _setFlightCode(String flightCode) {
    AppConstants.FLIGHT_CODE = flightCode;
  }

  void _setDepartureTime(String departureTime) {
    AppConstants.DEPARTURE_TIME = departureTime;
  }

  void _setDuration(String duration) {
    AppConstants.DURATION = duration;
  }

  void _setTotalTicketPrice(String ticketPrice) {
    int totalTicketPrice =
        int.parse(ticketPrice) * AppConstants.NUMBER_OF_TRAVELLER;
    AppConstants.TotalTicketPrice = totalTicketPrice;
  }
}
