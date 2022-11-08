import 'package:get/get.dart';
import 'package:swastik_air_hub/model/sector.dart';
import 'package:swastik_air_hub/repositories/sector_repo.dart';

class SectorController extends GetxController {
  final SectorRepo sectorRepo;
  SectorController({required this.sectorRepo});

  List<dynamic> _sectorList = [];
  List<dynamic> get sectorList => _sectorList;
  List<String> _sectorCodes = [];
  List<String> get sectorCodes => _sectorCodes;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getPopularProductList() async {
    Response response = await sectorRepo.getSectorList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _sectorList = [];
      SectorAPIResponse sectorResponse =
          SectorAPIResponse.fromJson(response.body);
      _sectorList.addAll(sectorResponse.sectors);
      for (Sector sector in _sectorList) {
        if (sectorCodes.length < 11) {
          sectorCodes.add(sector.sectorCode.toString());
        }
      }
      update();
    } else {
      print(response.statusCode);
    }
  }
}
