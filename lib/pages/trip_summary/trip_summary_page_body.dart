import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../controller/booking_details_controller.dart';
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
                    text: "Departure Date: " + AppConstants.FLIGHT_DATE,
                    color: Color.fromARGB(169, 42, 42, 43),
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Departure Time: " + AppConstants.DEPARTURE_TIME,
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
                    text: "Duration: " + AppConstants.DURATION,
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
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
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
                          text: AppConstants.NUMBER_OF_TRAVELLER.toString(),
                          color: Color.fromARGB(169, 42, 42, 43),
                          size: 18,
                        ),
                        BigText(
                          text: AppConstants.TotalTicketPrice.toString(),
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
              _saveBookingDetails();
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

  void _saveBookingDetails() {
    String flightCode = AppConstants.FLIGHT_CODE;
    String ticketCode = AppConstants.TICKET_CODE;
    String customerId = AppConstants.USER_ID;
    int numberOfTraveller = AppConstants.NUMBER_OF_TRAVELLER;
    int totalTicketPrice = AppConstants.TotalTicketPrice;
    print("ticket price" + totalTicketPrice.toString());
    List<PassengerRequest> passengerList = [];
    PassengerRequest passengerRequest = PassengerRequest(
        firstName: "dsfasd",
        lastName: "ASDfasd",
        middleName: "ASdfasd",
        phoneNumber: "Asdfasd");
    passengerList.add(passengerRequest);
    String status = "PURCHASED";
    BookingRequest request = BookingRequest(
        customerId: customerId,
        flightCode: flightCode,
        ticketCode: ticketCode,
        numberOfTraveller: numberOfTraveller,
        passengerList: passengerList,
        status: status,
        totalTicketPrice: AppConstants.TotalTicketPrice);
    var bookingController = Get.find<CustomerBookingDetailController>();
    bookingController.saveBookingDetails(request).then((status) {
      print(status.isSucces);
      if (status.isSucces) {
        showCustomSnackBar(totalTicketPrice.toString(),
            title: "Booking Detail");
        Get.toNamed(RouteHelper.getAvailablePaymentMethods());
      } else {
        showCustomSnackBar(status.message, title: "Booking Detail");
      }
    });
  }
}
