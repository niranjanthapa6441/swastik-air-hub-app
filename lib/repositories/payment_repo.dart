import 'package:get/get.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';

import '../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class CustomerPaymentDetailRepo extends GetxService {
  final ApiClient apiClient;
  CustomerPaymentDetailRepo({required this.apiClient});

  Future<Response> getCustomerPaymentDetails() async {
    return await apiClient.getData(
        AppConstants.CUSTOMER_PAYMENT_DETAIL_URI + AppConstants.USER_ID,
        apiClient.mainHeaders);
  }
}
