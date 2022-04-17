// import 'package:swastik_air_hub/model/passenger.dart';

// import 'customer.dart';
// import 'flight_ticket.dart';

// class CustomerBookingDetailResponse {
//   String? _code;
//   String? _message;
//   late List<Booking> _data;

//   List<Booking> get customerBookingDetails => _data;

//   CustomerBookingDetailResponse(
//       {required code, required message, required data}) {
//     _code = code;
//     _message = message;
//     _data = data;
//   }
//   CustomerBookingDetailResponse.fromJson(Map<String, dynamic> json) {
//     _code = json['code'];
//     _message = json['message'];
//     if (json['data'] != null) {
//       _data = <Booking>[];
//       json['data'].forEach((v) {
//         _data.add(Booking.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = _code;
//     data['message'] = _message;
//     if (_data != null) {
//       data['data'] = _data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Booking {
//   String? id;
//   FlightTicket? flightTicket;
//   Customer? customer;
//   String? bookingDate;
//   String? bookingTime;
//   String? numberOfTraveller;
//   String? totalPrice;
//   String? status;
//   List<Passenger>? passengerList;

//   Booking(
//       {this.id,
//       this.flightTicket,
//       this.customer,
//       this.bookingDate,
//       this.bookingTime,
//       this.numberOfTraveller,
//       this.totalPrice,
//       this.status,
//       this.passengerList});

//   Booking.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     flightTicket = json['flightTicket'] != null
//         ? new FlightTicket.fromJson(json['flightTicket'])
//         : null;
//     customer = json['customer'] != null
//         ? new Customer.fromJson(json['customer'])
//         : null;
//     bookingDate = json['bookingDate'];
//     bookingTime = json['bookingTime'];
//     numberOfTraveller = json['numberOfTraveller'];
//     totalPrice = json['totalPrice'];
//     status = json['status'];
//     if (json['passengerList'] != null) {
//       passengerList = <Passenger>[];
//       json['passengerList'].forEach((v) {
//         passengerList!.add(new Passenger.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.flightTicket != null) {
//       data['flightTicket'] = this.flightTicket!.toJson();
//     }
//     if (this.customer != null) {
//       data['customer'] = this.customer!.toJson();
//     }
//     data['bookingDate'] = this.bookingDate;
//     data['bookingTime'] = this.bookingTime;
//     data['numberOfTraveller'] = this.numberOfTraveller;
//     data['totalPrice'] = this.totalPrice;
//     data['status'] = this.status;
//     if (this.passengerList != null) {
//       data['passengerList'] =
//           this.passengerList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
