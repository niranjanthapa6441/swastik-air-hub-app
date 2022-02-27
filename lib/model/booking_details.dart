import 'package:swastik_air_hub/model/passenger.dart';

import 'customer.dart';
import 'flight_ticket.dart';

class BookingDetailAPIResponse {
  String? code;
  String? message;
  BookingDetails? data;

  BookingDetailAPIResponse({this.code, this.message, this.data});

  BookingDetailAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new BookingDetails.fromJson(json['data']) : null;
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

class BookingDetails {
  String? id;
  FlightTicket? flightTicket;
  Customer? customer;
  String? bookingDate;
  String? bookingTime;
  String? numberOfTraveller;
  String? totalPrice;
  String? status;
  List<Passenger>? passengerList;

  BookingDetails(
      {this.id,
      this.flightTicket,
      this.customer,
      this.bookingDate,
      this.bookingTime,
      this.numberOfTraveller,
      this.totalPrice,
      this.status,
      this.passengerList});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightTicket = json['flightTicket'] != null
        ? new FlightTicket.fromJson(json['flightTicket'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    numberOfTraveller = json['numberOfTraveller'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    if (json['passengerList'] != null) {
      passengerList = <Passenger>[];
      json['passengerList'].forEach((v) {
        passengerList!.add(new Passenger.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.flightTicket != null) {
      data['flightTicket'] = this.flightTicket!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['numberOfTraveller'] = this.numberOfTraveller;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    if (this.passengerList != null) {
      data['passengerList'] =
          this.passengerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}