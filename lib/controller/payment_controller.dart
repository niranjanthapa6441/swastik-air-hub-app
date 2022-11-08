import 'package:get/get.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';
import 'package:swastik_air_hub/model/payment_response.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';
import 'package:swastik_air_hub/repositories/payment_repo.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../model/response_model.dart';

class CustomerPaymentInfoController extends GetxController {
  final CustomerPaymentDetailRepo detailRepo;

  CustomerPaymentInfoController({required this.detailRepo});

  List<dynamic> _paymentDetails = [];
  List<dynamic> get customerPaymentDetails => _paymentDetails;
  void setCustomerPaymentDetails() {
    _paymentDetails = [];
  }

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getCustomerPaymentDetails() async {
    Response response = await detailRepo.getCustomerPaymentDetails();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _paymentDetails = [];
      PaymentResponse details = PaymentResponse.fromJson(response.body);

      _paymentDetails
          .addAll(PaymentResponse.fromJson(response.body).paymentInfos);
      print('details' + _paymentDetails.toString());
      update();
    } else {
      print(response.body["message"]);
    }
  }
}
