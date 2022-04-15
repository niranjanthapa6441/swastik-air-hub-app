import 'package:get/get.dart';

import '../../utils/api/api_client.dart';
import '../utils/app_constants/app_constants.dart';

class SectorRepo extends GetxService {
  final ApiClient apiClient;

  SectorRepo({required this.apiClient});

  Future<Response> getSectorList() async {
    return await apiClient.getData(
        AppConstants.SECTOR_URI, apiClient.mainHeaders);
  }
}
