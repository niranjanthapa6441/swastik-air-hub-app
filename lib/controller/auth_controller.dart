import 'package:get/get.dart';
import 'package:swastik_air_hub/model/LoginBody.dart';
import 'package:swastik_air_hub/model/SIgnUp.dart';
import 'package:swastik_air_hub/model/error_response.dart';
import 'package:swastik_air_hub/model/loginResponse.dart';
import 'package:swastik_air_hub/model/response_model.dart';
import 'package:swastik_air_hub/repositories/auth_repository.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});
  List<dynamic> _customerRegistrationDetails = [];
  List<dynamic> get customerRegistrationDetails => _customerRegistrationDetails;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  late LogInResponseModel details;
  late ErrorResponse errorDetails;
  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, response.body["message"]);
      print("sdfads");
      // _customerRegistrationDetails = [];
      // AuthResponse details = AuthResponse.fromJson(response.body);
      // _customerRegistrationDetails.addAll(
      //     AuthResponse.fromJson(response.body).customerRegistrationDetails);
      print(_customerRegistrationDetails);
    } else {
      print(response.body);
      responseModel = ResponseModel(false, response.body["message"]);
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> login(LoginBody loginBody) async {
    _isLoading = true;
    Response response = await authRepo.login(loginBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      details = LogInResponseModel.fromJson(response.body);
      responseModel = ResponseModel(true, response.body["message"]);
      authRepo.saveUserToken(details.data!.accessToken.toString());
      AppConstants.USER_ID = details.data!.customerId.toString();
    } else {
      responseModel = ResponseModel(false, response.body["message"]);
    }
    update();
    return responseModel;
  }
  //toDO
  // Future<Void> save async(LoginBody body) {
  //   try{

  //   }
  //   catch(e){

  //   }
  // }
}
