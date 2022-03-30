import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swastik_air_hub/model/LoginBody.dart';
import 'package:swastik_air_hub/model/SIgnUp.dart';
import 'package:swastik_air_hub/utils/api/api_client.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo({required this.apiClient});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.SIGN_UP_URI, signUpBody.toJson());
  }

  Future<Response> login(LoginBody loginBody) async {
    return await apiClient.postData(
        AppConstants.SIGN_IN_URI, loginBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    print(token.toString() + "token");
  }
}
