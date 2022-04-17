import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swastik_air_hub/controller/auth_controller.dart';
import 'package:swastik_air_hub/controller/booking_details_controller.dart';
import 'package:swastik_air_hub/controller/flight_controller.dart';
import 'package:swastik_air_hub/controller/payment_controller.dart';
import 'package:swastik_air_hub/controller/sector_controller.dart';
import 'package:swastik_air_hub/repositories/auth_repository.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';
import 'package:swastik_air_hub/repositories/buddha_flight_repo.dart';
import 'package:swastik_air_hub/repositories/nepal_airlines_search_flight_repo.dart';
import 'package:swastik_air_hub/repositories/search_flight_reposiitory.dart';
import 'package:swastik_air_hub/repositories/sector_repo.dart';
import 'package:swastik_air_hub/utils/utils/api/nepal_airline_api_client.dart';
import '../../repositories/payment_repo.dart';
import '../utils/api/buddha_api_client.dart';
import '../api/api_client.dart';
import '../app_constants/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //apiCLient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => BuddhApiClient(appBaseUrl: AppConstants.BUDDHA_BASE_URL));
  Get.lazyPut(() =>
      NepalAirlinesApiClient(appBaseUrl: AppConstants.NEPAL_AIRLINES_BASE_URL));

  //repos
  Get.lazyPut(() => CustomerBookingDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
  Get.lazyPut(() => SearchFlightRepo(apiClient: Get.find()));
  Get.lazyPut(() => SectorRepo(apiClient: Get.find()));
  Get.lazyPut(() => BuddhaSearchFlightRepo(apiClient: Get.find()));
  Get.lazyPut(() => NepalAirlinesSearchFlightRepo(apiClient: Get.find()));
  Get.lazyPut(() => CustomerPaymentDetailRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => CustomerBookingDetailController(detailRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => FlightController(
      searchFlightRepo: Get.find(),
      buddhaSearchFlightRepo: Get.find(),
      nepalAirlinesSearchFlightRepo: Get.find()));
  Get.lazyPut(() => SectorController(sectorRepo: Get.find()));
  Get.lazyPut(() => CustomerPaymentInfoController(detailRepo: Get.find()));
}
