class ResponseModel {
  bool _isSuccess;
  String _message;
  ResponseModel(this._isSuccess, this._message);
  String get message => _message;
  bool get isSucces => _isSuccess;
}

class ErrorData {
  String? password;

  ErrorData({this.password});

  ErrorData.fromJson(Map<String, dynamic> json) {
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    return data;
  }
}
