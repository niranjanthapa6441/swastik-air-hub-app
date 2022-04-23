import 'package:get/get.dart';
import 'package:swastik_air_hub/model/response_model.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/model/search_flight_response.dart';
import 'package:swastik_air_hub/repositories/buddha_flight_repo.dart';
import 'package:swastik_air_hub/repositories/nepal_airlines_search_flight_repo.dart';
import 'package:swastik_air_hub/repositories/search_flight_reposiitory.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../model/search_flight_nepal_airlines_response.dart';

class FlightController extends GetxController implements GetxService {
  final SearchFlightRepo searchFlightRepo;
  final BuddhaSearchFlightRepo buddhaSearchFlightRepo;
  final NepalAirlinesSearchFlightRepo nepalAirlinesSearchFlightRepo;

  FlightController(
      {required this.searchFlightRepo,
      required this.buddhaSearchFlightRepo,
      required this.nepalAirlinesSearchFlightRepo});
  List<dynamic> _availableFlightsLowToHigh = [];
  List<dynamic> get availableFlightsLowToHigh => _availableFlightsLowToHigh;
  List<dynamic> _availableFlightsHighToLow = [];
  List<dynamic> get availableFlightsHighToLow => _availableFlightsHighToLow;
  List<dynamic> _buddhaFlightResponse = [];
  List<dynamic> get buddhaFlightResponse => _buddhaFlightResponse;
  List<dynamic> _nepalAirlinesFLightResponse = [];
  List<dynamic> get nepalAirlinesFLightResponse => _nepalAirlinesFLightResponse;
  List<dynamic> _list = [];
  List<dynamic> get list => _list;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late SearchFlightResponse searchFLightAPIResponse;
  late SearchFlightResponse buddhasearchFLightAPIResponse;
  late NepalAirlinesSearchFlightResponse nepalAirlinessearchFLightAPIResponse;

  late ResponseModel responseModel;

  Future<ResponseModel> findAvailableflights(
      SearchFlightRequestBody requestBody) async {
    _isLoading = true;
    Response response =
        await searchFlightRepo.findAvailableFlights(requestBody);
    Response buddhaResponse =
        await buddhaSearchFlightRepo.findAvailableFlights(requestBody);
    Response nepalAirlinesResposne =
        await nepalAirlinesSearchFlightRepo.findAvailableFlights(requestBody);
    if (response.statusCode == 200) {
      searchFLightAPIResponse = SearchFlightResponse.fromJson(response.body);
      buddhasearchFLightAPIResponse =
          SearchFlightResponse.fromJson(buddhaResponse.body);
      nepalAirlinessearchFLightAPIResponse =
          NepalAirlinesSearchFlightResponse.fromJson(
              nepalAirlinesResposne.body);
      _availableFlightsLowToHigh = [];
      _buddhaFlightResponse = [];
      _buddhaFlightResponse
          .addAll(buddhasearchFLightAPIResponse.availableFlightDetail);
      _buddhaFlightResponse = [];
      _buddhaFlightResponse
          .addAll(buddhasearchFLightAPIResponse.availableFlightDetail);
      _nepalAirlinesFLightResponse = [];
      _nepalAirlinesFLightResponse
          .addAll(nepalAirlinessearchFLightAPIResponse.availableFlightDetail);
      _buddhaFlightResponse.forEach((element) {
        SearchFlightModel model = element;
      });
      _nepalAirlinesFLightResponse.forEach((element) {
        SearchFlightModel model = element;
      });
      _availableFlightsLowToHigh
          .addAll(buddhasearchFLightAPIResponse.availableFlightDetail);
      _availableFlightsLowToHigh
          .addAll(nepalAirlinessearchFLightAPIResponse.availableFlightDetail);
      responseModel = ResponseModel(true, response.body["message"]);
      _availableFlightsLowToHigh.forEach((v) {
        SearchFlightModel model = v;
        AppConstants.FROM = model.sector!.from.toString();
        AppConstants.To = model.sector!.to.toString();
        AppConstants.FLIGHT_DATE = model.departureDate.toString();
        //fromHighToLowPrice(_availableFlightsLowToHigh);
      });
    } else {
      searchFLightAPIResponse = SearchFlightResponse.fromJson(response.body);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    update();
    return responseModel;
  }
}
