import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/image_text.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../controller/booking_details_controller.dart';
import '../../model/bookingRequest.dart';
import '../../route_helper/route_helper.dart';
import '../../utils/app_constants/app_constants.dart';

class ShowAvailablePaymentMethodPageBody extends StatefulWidget {
  const ShowAvailablePaymentMethodPageBody({Key? key}) : super(key: key);

  @override
  State<ShowAvailablePaymentMethodPageBody> createState() =>
      _ShowAvailablePaymentMethodPageBodyState();
}

class _ShowAvailablePaymentMethodPageBodyState
    extends State<ShowAvailablePaymentMethodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.height10),
      child: ListView(
        children: [
          GestureDetector(
            child: ImageAndTextWidget(
                imageURl: "assets/image/khalti.png", text: "Pay Via Khalti"),
            onTap: () {
              KhaltiScope.of(context).pay(
                config: PaymentConfig(
                  amount: 200 * 100,
                  productIdentity: 'dells-sssssg5-g5510-2021',
                  productName: 'Product Name',
                ),
                preferences: [
                  PaymentPreference.khalti,
                ],
                onSuccess: (su) {
                  const successsnackBar = SnackBar(
                    content: Text('Payment Successful'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(successsnackBar);
                  AppConstants.paidAmount = su.amount;
                  AppConstants.paymentMethod = "Online";
                  AppConstants.paidVia = "Khalti";
                  _saveBookingDetails();
                },
                onFailure: (fa) {
                  const failedsnackBar = SnackBar(
                    content: Text('Payment Failed'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(failedsnackBar);
                },
                onCancel: () {
                  const cancelsnackBar = SnackBar(
                    content: Text('Payment Cancelled'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(cancelsnackBar);
                },
              );
            },
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          ImageAndTextWidget(
              imageURl: "assets/image/esewa.png", text: "Pay Via esewa"),
          SizedBox(
            height: Dimensions.height20,
          ),
          ImageAndTextWidget(
              imageURl: "assets/image/googleplay.png",
              text: "Pay Via GooglePay"),
          SizedBox(
            height: Dimensions.height20,
          ),
          ImageAndTextWidget(
              imageURl: "assets/image/paypal.png", text: "Pay Via PayPal"),
          SizedBox(
            height: Dimensions.height20,
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
    List<PassengerRequest> passengerList = AppConstants.passengerList();
    String status = "PURCHASED";
    BookingRequest request = BookingRequest(
        customerId: customerId,
        flightCode: flightCode,
        ticketCode: ticketCode,
        numberOfTraveller: numberOfTraveller,
        passengerList: passengerList,
        status: status,
        totalTicketPrice: AppConstants.TotalTicketPrice,
        paidAmount: AppConstants.paidAmount,
        paymentMethod: AppConstants.paymentMethod,
        paymentStatus: "Sucess",
        paidVia: AppConstants.paidVia);

    var bookingController = Get.find<CustomerBookingDetailController>();
    bookingController.saveBookingDetails(request).then((status) {
      print(status.isSucces);
      if (status.isSucces) {
        showCustomSnackBar(totalTicketPrice.toString(),
            title: "Booking Detail");
        Get.toNamed(RouteHelper.getNavigation());
      } else {
        showCustomSnackBar(status.message, title: "Booking Detail");
      }
    });
  }
}
