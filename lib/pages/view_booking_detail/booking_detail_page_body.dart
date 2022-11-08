import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/passenger_ticket_controller.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/passenger_ticket.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../controller/booking_details_controller.dart';

class BookingDetailPageBody extends StatelessWidget {
  int pageId;
  BookingDetailPageBody({required this.pageId, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Booking booking = Get.find<CustomerBookingDetailController>()
        .customerBookingDetails[pageId];
    AppConstants.BOOKING_ID = booking.id!;
    Get.put(PassengerTicketController(passengerTicketRepo: Get.find()));
    Get.find<PassengerTicketController>().getPassengerTickets();
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
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
              height: Dimensions.height35 * 11,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height30,
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
                    bottom: Dimensions.height30,
                    top: Dimensions.height30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Booking Date: " + booking.bookingDate.toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Booking time: " + booking.bookingTime.toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Departure Date:  " +
                          booking.flightTicket!.detail!.departureDate
                              .toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Departure Time: " +
                          booking.flightTicket!.detail!.departureTime
                              .toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Airlines: " +
                          booking.flightTicket!.detail!.company!.name
                              .toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Number Of Traveller " +
                          booking.numberOfTraveller.toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Total Paid Amount : " +
                          booking.totalTicketPrice.toString(),
                      color: Color.fromARGB(169, 42, 42, 43),
                      size: 18,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(
                      text: "Status: " + booking.status.toString(),
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
              child: BigText(text: "Ticket"),
            ),
            GetBuilder<PassengerTicketController>(builder: (passengerTickets) {
              return Container(
                height: Dimensions.height10 * 39,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: passengerTickets.passengerTicketDetails.isEmpty
                      ? 0
                      : passengerTickets.passengerTicketDetails.length,
                  itemBuilder: (context, index) {
                    return _buildRecommendedItemPage(
                        index, passengerTickets.passengerTicketDetails[index]);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedItemPage(int index, PassengerTicket passenger) {
    return Container(
      height: Dimensions.height10 * 37,
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
            bottom: Dimensions.height20,
            top: Dimensions.height20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: "Full Name: " + passenger.passengerName.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Departure Date: " + passenger.departureDate.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Departure time: " + passenger.departureTime.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Departure: " + passenger.departure.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Arrival: " + passenger.arrival.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Sector Code: " + passenger.sectorCode.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Flight Code: " + passenger.flightCode.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            BigText(
              text: "Ticket Price: " + passenger.ticketPrice.toString(),
              color: Color.fromARGB(169, 42, 42, 43),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
