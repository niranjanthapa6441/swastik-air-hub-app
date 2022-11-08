import 'package:swastik_air_hub/model/search_flight_response.dart';

class PaymentResponse {
  String? _code;
  String? _message;
  late List<Payment> _data;
  List<Payment> get paymentInfos => _data;
  String? get code => _code;
  String? get message => _message;
  PaymentResponse({required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  PaymentResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Payment>[];
      json['data'].forEach((v) {
        _data.add(Payment.fromJson(v));
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

class Payment {
  String? id;
  Booking? booking;
  int? totalAmount;
  String? paymentMethod;
  String? paymentDate;
  String? paymentTIme;
  String? paidVia;
  String? status;

  Payment(
      {this.id,
      this.booking,
      this.totalAmount,
      this.paymentMethod,
      this.paymentDate,
      this.paymentTIme,
      this.paidVia,
      this.status});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
    totalAmount = json['totalAmount'];
    paymentMethod = json['paymentMethod'];
    paymentDate = json['paymentDate'];
    paymentTIme = json['paymentTIme'];
    paidVia = json['paidVia'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    data['totalAmount'] = this.totalAmount;
    data['paymentMethod'] = this.paymentMethod;
    data['paymentDate'] = this.paymentDate;
    data['paymentTIme'] = this.paymentTIme;
    data['paidVia'] = this.paidVia;
    data['status'] = this.status;
    return data;
  }
}

class Booking {
  String? id;
  String? bookingDate;
  String? bookingTime;
  int? numberOfTraveller;
  int? totalTicketPrice;
  String? status;

  Booking(
      {this.id,
      this.bookingDate,
      this.bookingTime,
      this.numberOfTraveller,
      this.totalTicketPrice,
      this.status});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    numberOfTraveller = json['numberOfTraveller'];
    totalTicketPrice = json['totalTicketPrice'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookingDate'] = this.bookingDate;
    data['bookingTime'] = this.bookingTime;
    data['numberOfTraveller'] = this.numberOfTraveller;
    data['totalTicketPrice'] = this.totalTicketPrice;
    data['status'] = this.status;
    return data;
  }
}
