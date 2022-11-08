import 'package:get/get.dart';
import 'package:swastik_air_hub/model/update_profile_request.dart';
import '../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class CustomerDetailRepo extends GetxService {
  final ApiClient apiClient;
  CustomerDetailRepo({required this.apiClient});

  Future<Response> getCustomerDetails() async {
    return await apiClient.getData(
        AppConstants.CUSTOMER_URI + AppConstants.USER_ID,
        apiClient.mainHeaders);
  }

  Future<Response> updateCustomer(UpdateProfileRequest request) async {
    print(apiClient.mainHeaders.toString() + 'headers');
    print(request.firstName);
    return await apiClient.put(
        AppConstants.CUSTOMER_URI + AppConstants.USER_ID, request.toJson(),
        headers: apiClient.mainHeaders);
  }
}
