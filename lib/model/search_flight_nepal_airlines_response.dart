import 'package:swastik_air_hub/model/search_flight_response.dart';

class NepalAirlinesSearchFlightResponse {
  String? _code;
  String? _message;
  late List<SearchFlightModel> _data;
  List<SearchFlightModel> get availableFlightDetail => _data;
  String? get code => _code;
  String? get message => _message;
  NepalAirlinesSearchFlightResponse(
      {required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  NepalAirlinesSearchFlightResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <SearchFlightModel>[];
      json['data'].forEach((v) {
        _data.add(SearchFlightModel.fromNepalAirlinesJson(v));
      });
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['code'] = this._code;
      data['message'] = this._message;
      if (this._data != null) {
        data['data'] = this._data.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }
}
