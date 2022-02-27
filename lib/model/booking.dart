import 'customer.dart';
import 'flight_ticket.dart';

class Booking {
  String? id;
  FlightTicket? flightTicket;
  Customer? customer;
  String? bookingDate;
  String? bookingTime;
  int? numberOfTraveller;
  int? totalTicketPrice;
  String? status;

  Booking(
      {this.id,
      this.flightTicket,
      this.customer,
      this.bookingDate,
      this.bookingTime,
      this.numberOfTraveller,
      this.totalTicketPrice,
      this.status});

  Booking.fromJson(Map<String, dynamic> json) {
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
    totalTicketPrice = json['totalTicketPrice'];
    status = json['status'];
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
    data['totalTicketPrice'] = this.totalTicketPrice;
    data['status'] = this.status;
    return data;
  }
}
