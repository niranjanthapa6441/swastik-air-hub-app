import 'package:get/get.dart';
import 'package:swastik_air_hub/model/booking.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';
import 'package:swastik_air_hub/repositories/booking_details_repo.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

import '../model/response_model.dart';

class CustomerBookingDetailController extends GetxController {
  final CustomerBookingDetailRepo detailRepo;

  CustomerBookingDetailController({required this.detailRepo});

  List<dynamic> _customerBookingDetails = [];
  List<dynamic> get customerBookingDetails => _customerBookingDetails;
  void setCustomerBookingDetail() {
    _customerBookingDetails = [];
  }

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getCustomerBookingDetails() async {
    print(AppConstants.USER_ID);

    Response response = await detailRepo.getCustomerBookingDetails();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _customerBookingDetails = [];
      CustomerBookingDetailResponse details =
          CustomerBookingDetailResponse.fromJson(response.body);

      _customerBookingDetails.addAll(
          CustomerBookingDetailResponse.fromJson(response.body)
              .customerBookingDetails);
      _customerBookingDetails.forEach((element) {
        Booking booking = element;
        print('list' + booking.passengerList.toString());
      });
      update();
    } else {
      print(response.body["message"]);
    }
  }

  Future<ResponseModel> saveBookingDetails(BookingRequest request) async {
    Response response = await detailRepo.bookTickets(request);
    late ResponseModel responseModel;
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
    } else {
      responseModel = ResponseModel(false, response.body["message"]);
    }
    update();
    return responseModel;
  }
}
