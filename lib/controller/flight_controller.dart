import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swastik_air_hub/model/LoginBody.dart';
import 'package:swastik_air_hub/model/SIgnUp.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/customer.dart';
import 'package:swastik_air_hub/model/error_response.dart';
import 'package:swastik_air_hub/model/loginResponse.dart';
import 'package:swastik_air_hub/model/response_model.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/model/search_flight_response.dart';
import 'package:swastik_air_hub/repositories/auth_repository.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';
import 'package:swastik_air_hub/repositories/search_flight_reposiitory.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

class FlightController extends GetxController implements GetxService {
  final SearchFlightRepo searchFlightRepo;

  FlightController({required this.searchFlightRepo});
  List<dynamic> _availableFlights = [];
  List<dynamic> get availableFlights => _availableFlights;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late SearchFlightResponse searchFLightAPIResponse;
  late ResponseModel responseModel;

  Future<ResponseModel> findAvailableflights(
      SearchFlightRequestBody requestBody) async {
    _isLoading = true;
    Response response =
        await searchFlightRepo.findAvailableFlights(requestBody);
    if (response.statusCode == 200) {
      searchFLightAPIResponse = SearchFlightResponse.fromJson(response.body);
      _availableFlights = [];
      _availableFlights.addAll(searchFLightAPIResponse.availableFlightDetail);
      responseModel = ResponseModel(true, response.body["message"]);
      _availableFlights.forEach((v) {
        SearchFlightModel model = v;
        AppConstants.FROM = model.sector!.from.toString();
        AppConstants.To = model.sector!.to.toString();
        AppConstants.FLIGHT_DATE = model.departureDate.toString();
      });
    } else {
      searchFLightAPIResponse = SearchFlightResponse.fromJson(response.body);
      responseModel = ResponseModel(false, response.body["message"]);
      print(response.body);
    }
    update();
    return responseModel;
  }
  //toDO
  // Future<Void> save async(LoginBody body) {
  //   try{

  //   }
  //   catch(e){

  //   }
  // }
}
