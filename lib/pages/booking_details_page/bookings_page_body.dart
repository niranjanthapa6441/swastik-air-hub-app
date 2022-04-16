import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:swastik_air_hub/controller/booking_details_controller.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/search_flight_response.dart';
import 'package:swastik_air_hub/pages/view_booking_detail/main_booking_detail.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';

import '../../utils/Color/colors.dart';
import '../../utils/dimesions/dimesions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class BookingsBody extends StatefulWidget {
  const BookingsBody({Key? key}) : super(key: key);

  @override
  _BookingDetailsBodyState createState() => _BookingDetailsBodyState();
}

class _BookingDetailsBodyState extends State<BookingsBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    print("current screen height" +
        MediaQuery.of(context).size.height.toString());
    print("width" + MediaQuery.of(context).size.width.toString());
    Get.find<CustomerBookingDetailController>().getCustomerBookingDetails();

    return Column(
      children: [
        GetBuilder<CustomerBookingDetailController>(
          builder: (popularProducts) {
            return Container(
              margin: EdgeInsets.only(
                top: Dimensions.width20,
              ),
              height: Dimensions.height10 * 68,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularProducts.customerBookingDetails.isEmpty
                    ? 0
                    : popularProducts.customerBookingDetails.length,
                itemBuilder: (context, index) {
                  return popularProducts.isLoaded
                      ? _buildCustomerBookingDetailItemPage(
                          index, popularProducts.customerBookingDetails[index])
                      : CircularProgressIndicator(
                          color: AppColors.purpleColor,
                        );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCustomerBookingDetailItemPage(int index, Booking booking) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Color.fromARGB(220, 234, 235, 233),
      ),
      height: Dimensions.width10 * 22,
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
              color: Color.fromARGB(169, 113, 103, 250),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(
                  text: booking.bookingDate.toString(),
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
          //textContainer
          Expanded(
            child: Container(
              width: 230,
              height: Dimensions.width10 * 18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Departure Date: " +
                        booking.flightTicket!.detail!.departureDate.toString() ,
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Sector: " +
                        booking.flightTicket!.detail!.sector!.sectorCode
                            .toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Departure Time: " +
                        booking.flightTicket!.detail!.departureTime.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Status: " + booking.status.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20 * 0.92,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getViewBookingDetail(index));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallText(
                          text: "Show More",
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
}
