import 'package:get/get.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../utils/utils/api/buddha_api_client.dart';

class BuddhaSearchFlightRepo {
  final BuddhApiClient apiClient;

  BuddhaSearchFlightRepo({required this.apiClient});

  Future<Response> findAvailableFlights(
      SearchFlightRequestBody requestBody) async {
    return await apiClient.postData(
        AppConstants.SEARCH_AVAILABLE_FLIGHT_URI, requestBody.toJson());
  }

  Future<Response> findAvailbleFlights() async {
    return await apiClient.get('api/v1/flight');
  }
}
