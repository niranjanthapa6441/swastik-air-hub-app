import 'package:swastik_air_hub/model/flight.dart';
import 'package:swastik_air_hub/model/tickets.dart';

import 'booking_details.dart';

class FlightTicket {
  String? id;
  Ticket? ticket;
  Flight? detail;

  FlightTicket({this.id, this.ticket, this.detail});

  FlightTicket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
    detail =
        json['detail'] != null ? new Flight.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}