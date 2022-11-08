class ErrorResponse {
  String? code;
  String? message;
  String? errorData;

  ErrorResponse({this.code, this.message, this.errorData});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    errorData = json['errorData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['errorData'] = this.errorData;
    return data;
  }
}
