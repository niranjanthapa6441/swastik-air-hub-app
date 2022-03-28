import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/booking_details_controller.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';

import '../api/api_client.dart';
import '../app_constants/app_constants.dart';

Future<void> init() async {
  //apiCLient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => CustomerBookingDetailRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => CustomerBookingDetailController(detailRepo: Get.find()));
}
