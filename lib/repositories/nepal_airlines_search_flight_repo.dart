import 'package:get/get.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../utils/utils/api/nepal_airline_api_client.dart';

class NepalAirlinesSearchFlightRepo {
  final NepalAirlinesApiClient apiClient;

  NepalAirlinesSearchFlightRepo({required this.apiClient});

  Future<Response> findAvailableFlights(
      SearchFlightRequestBody requestBody) async {
    return await apiClient.postData(
        AppConstants.SEARCH_AVAILABLE_FLIGHT_URI, requestBody.toJson());
  }
}
