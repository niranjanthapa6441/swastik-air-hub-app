import 'package:get/get.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/booking_details.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';

class CustomerBookingDetailController extends GetxController {
  final CustomerBookingDetailRepo detailRepo;

  CustomerBookingDetailController({required this.detailRepo});

  List<dynamic> _customerBookingDetails = [];
  List<dynamic> get customerBookingDetails => _customerBookingDetails;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getPopularProductList() async {
    Response response = await detailRepo.getCustomerBookingDetails();
    print(response.statusCode);
    print(response.statusText);
    if (response.statusCode == 200) {
      print("products");
      _isLoaded = true;
      _customerBookingDetails = [];
      CustomerBookingDetailResponse details =
          CustomerBookingDetailResponse.fromJson(response.body);
      _customerBookingDetails.addAll(
          CustomerBookingDetailResponse.fromJson(response.body)
              .customerBookingDetails);
      update();
    } else {
      print(response.body["message"]);
    }
  }
}
