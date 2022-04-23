import 'package:get/get.dart';
import 'package:swastik_air_hub/model/customer.dart';
import 'package:swastik_air_hub/model/payment_response.dart';
import 'package:swastik_air_hub/repositories/customer_repo.dart';

class CustomerDetailController extends GetxController {
  final CustomerDetailRepo detailRepo;

  CustomerDetailController({required this.detailRepo});
  Customer? customer;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getCustomerPaymentDetails() async {
    Response response = await detailRepo.getCustomerDetails();
    if (response.statusCode == 200) {
      _isLoaded = true;
      customer = CustomerDetailResponse.fromJson(response.body).data;
      update();
    } else {
      print(response.body["message"]);
    }
  }
}
