class AirlineCompanyAPIResponse {
  String? code;
  String? message;
  Company? data;

  AirlineCompanyAPIResponse({this.code, this.message, this.data});

  AirlineCompanyAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Company.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Company {
  String? id;
  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? contractDate;
  String? contractStatus;

  Company(
      {this.id,
      this.name,
      this.address,
      this.email,
      this.phoneNumber,
      this.contractDate,
      this.contractStatus});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    contractDate = json['contractDate'];
    contractStatus = json['contractStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['contractDate'] = this.contractDate;
    data['contractStatus'] = this.contractStatus;
    return data;
  }
}
