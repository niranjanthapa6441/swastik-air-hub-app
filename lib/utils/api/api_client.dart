import 'package:get/get.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  Map<String, String> get mainHeaders => _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = "rtrtwert";
    _mainHeaders = {
      "Content-type": "application/json; charset-UTF_8",
      "Authorization": "Bearer $token"
    };
  }
  void updateHeader(String token) {
    print(token.toString() + "   updated token");
    _mainHeaders = {
      "Content-type": "application/json; charset-UTF_8",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> getData(
    String uri,
  ) async {
    try {
      print("I am here");
      print(_mainHeaders.toString() + "hgcghchc");
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      print("haader token    " + token);
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
