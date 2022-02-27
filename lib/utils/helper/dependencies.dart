import 'package:get/get.dart';

import '../api/api_client.dart';
import '../app_constants/app_constants.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // //repos
  // Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // //controllers
  // Get.lazyPut(() => PopularProductController(productRepo: Get.find()));
}
