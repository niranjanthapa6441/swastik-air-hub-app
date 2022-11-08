import 'package:get/get.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../utils/api/api_client.dart';

class SearchFlightRepo {
  final ApiClient apiClient;

  SearchFlightRepo({required this.apiClient});

  Future<Response> findAvailableFlights(
      SearchFlightRequestBody requestBody) async {
    return await apiClient.postData(
        AppConstants.SEARCH_AVAILABLE_FLIGHT_URI, requestBody.toJson());
  }
}
