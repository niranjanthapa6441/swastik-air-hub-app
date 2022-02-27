import 'package:swastik_air_hub/model/sector.dart';

import 'airline_company.dart';

class FlightAPiResponse {
  String? code;
  String? message;
  Flight? data;

  FlightAPiResponse({this.code, this.message, this.data});

  FlightAPiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Flight.fromJson(json['data']) : null;
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

class Flight {
  String? id;
  String? flightCode;
  String? departureDate;
  String? departureTime;
  int? numberOfAvailableSeats;
  Sector? sector;
  Company? company;
  String? status;

  Flight(
      {this.id,
      this.flightCode,
      this.departureDate,
      this.departureTime,
      this.numberOfAvailableSeats,
      this.sector,
      this.company,
      this.status});

  Flight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightCode = json['flightCode'];
    departureDate = json['departureDate'];
    departureTime = json['departureTime'];
    numberOfAvailableSeats = json['numberOfAvailableSeats'];
    sector =
        json['sector'] != null ? new Sector.fromJson(json['sector']) : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flightCode'] = this.flightCode;
    data['departureDate'] = this.departureDate;
    data['departureTime'] = this.departureTime;
    data['numberOfAvailableSeats'] = this.numberOfAvailableSeats;
    if (this.sector != null) {
      data['sector'] = this.sector!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}