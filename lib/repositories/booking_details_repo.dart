import 'package:get/get.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';
import 'package:swastik_air_hub/model/userId.dart';

import '../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class CustomerBookingDetailRepo extends GetxService {
  final ApiClient apiClient;
  CustomerBookingDetailRepo({required this.apiClient});

  Future<Response> getCustomerBookingDetails() async {
    return await apiClient.getData(
        AppConstants.CUSTOMER_BOOKING_DETAIL_URI + AppConstants.USER_ID,
        apiClient.mainHeaders);
  }

  Future<Response> bookTickets(BookingRequest request) async {
    return await apiClient.postData(
        AppConstants.SAVE_BOOKING_DETAIL_URI, request.toJson());
  }
}
