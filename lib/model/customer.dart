import 'package:swastik_air_hub/model/booking.dart';

class AuthResponse {
  String? _code;
  String? _message;
  late List<Customer> _data;
  List<Customer> get customerRegistrationDetails => _data;

  AuthResponse({required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  AuthResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Customer>[];
      json['data'].forEach((v) {
        _data.add(Customer.fromJson(v));
      });
    }
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? email;
  String? username;
  String? phoneNumber;
  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.username,
      this.phoneNumber});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
