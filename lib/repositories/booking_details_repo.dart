import 'package:get/get.dart';

import '../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class CustomerBookingDetailRepo extends GetxService {
  final ApiClient apiClient;

  CustomerBookingDetailRepo({required this.apiClient});

  Future<Response> getCustomerBookingDetails() async {
    print(apiClient.mainHeaders);
    return await apiClient.get(AppConstants.CUSTOMER_BOOKING_DETAIL_URI);
  }
}
