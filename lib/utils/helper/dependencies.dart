import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swastik_air_hub/controller/auth_controller.dart';
import 'package:swastik_air_hub/controller/booking_details_controller.dart';
import 'package:swastik_air_hub/repositories/auth_repository.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';

import '../api/api_client.dart';
import '../app_constants/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //apiCLient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => CustomerBookingDetailRepo(apiClient: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => CustomerBookingDetailController(detailRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
