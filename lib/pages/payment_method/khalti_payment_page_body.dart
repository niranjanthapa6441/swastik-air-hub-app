import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../controller/booking_details_controller.dart';
import '../../model/bookingRequest.dart';
import '../../route_helper/route_helper.dart';
import '../../utils/app_constants/app_constants.dart';

class KhaltiPaymentPageBody extends StatefulWidget {
  const KhaltiPaymentPageBody({Key? key}) : super(key: key);

  @override
  _ShowAvailablePaymentPageBodyState createState() =>
      _ShowAvailablePaymentPageBodyState();
}

class _ShowAvailablePaymentPageBodyState extends State<KhaltiPaymentPageBody> {
  TextEditingController amountController = TextEditingController();

  getAmt() {
    return int.parse(amountController.text) * 100; // Converting to paisa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            // For Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Enter Amount to pay",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            // For Button
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red)),
                height: 50,
                color: const Color(0xFF56328c),
                child: const Text(
                  'Pay With Khalti',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: () {
                  KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                      amount: getAmt(),
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
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successsnackBar);
                      AppConstants.paidAmount = su.amount;
                      AppConstants.paymentMethod = "Online";
                      AppConstants.paidVia = "Khalti";
                      _saveBookingDetails();
                    },
                    onFailure: (fa) {
                      const failedsnackBar = SnackBar(
                        content: Text('Payment Failed'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(failedsnackBar);
                    },
                    onCancel: () {
                      const cancelsnackBar = SnackBar(
                        content: Text('Payment Cancelled'),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(cancelsnackBar);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  void _saveBookingDetails() {
    String flightCode = AppConstants.FLIGHT_CODE;
    String ticketCode = AppConstants.TICKET_CODE;
    String customerId = AppConstants.USER_ID;
    int numberOfTraveller = AppConstants.NUMBER_OF_TRAVELLER;
    int totalTicketPrice = AppConstants.TotalTicketPrice;
    List<PassengerRequest> passengerList = [];
    for (int i = 0; i < AppConstants.NUMBER_OF_TRAVELLER; i++) {
      PassengerRequest passengerRequest = PassengerRequest(
          firstName: "First Name",
          lastName: "Last Name",
          middleName: "Middle Name",
          phoneNumber: "9999999999");
      passengerList.add(passengerRequest);
    }
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
        customSnackBar(totalTicketPrice.toString(), title: "Booking Detail");
        Get.toNamed(RouteHelper.getNavigation());
      } else {
        showCustomSnackBar(status.message, title: "Booking Detail");
      }
    });
  }

  void customSnackBar(String message,
      {bool isError = true,
      String title = "Error",
      Color color = Colors.green}) {
    Get.snackbar(title, message,
        titleText: BigText(
          text: title,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: color);
  }
}
