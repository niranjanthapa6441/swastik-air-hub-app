import 'package:get/get.dart';
import '../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class PassengerTicketRepo extends GetxService {
  final ApiClient apiClient;
  PassengerTicketRepo({required this.apiClient});

  Future<Response> getPassengerTicket() async {
    return await apiClient.getData(
        AppConstants.PASSENGER_TICKET_URI + AppConstants.BOOKING_ID,
        apiClient.mainHeaders);
  }
}
