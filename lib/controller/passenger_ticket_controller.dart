import 'package:get/get.dart';
import 'package:swastik_air_hub/model/passenger_ticket.dart';
import 'package:swastik_air_hub/repositories/passenger_ticket_repo.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

class PassengerTicketController extends GetxController {
  final PassengerTicketRepo passengerTicketRepo;

  PassengerTicketController({required this.passengerTicketRepo});

  List<dynamic> _passengerTicketDetails = [];
  List<dynamic> get passengerTicketDetails => _passengerTicketDetails;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getPassengerTickets() async {
    Response response = await passengerTicketRepo.getPassengerTicket();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _passengerTicketDetails = [];
      PassengerTicketResponse details =
          PassengerTicketResponse.fromJson(response.body);

      _passengerTicketDetails.addAll(
          PassengerTicketResponse.fromJson(response.body)
              .passengerTicketDetails);

      _passengerTicketDetails.forEach((element) {
        PassengerTicket data = element;
        print("datedsfsdfsd" + data.arrival.toString());
      });
      update();
    } else {
      print(response.body["message"]);
    }
  }
}
