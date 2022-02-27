class TicketAPIResponse {
  String? code;
  String? message;
  Ticket? data;

  TicketAPIResponse({this.code, this.message, this.data});

  TicketAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Ticket.fromJson(json['data']) : null;
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

class Ticket {
  int? id;
  String? ticketCode;
  int? price;
  Null? cancellationPolicy;
  Null? baggagePolicy;
  String? status;

  Ticket(
      {this.id,
      this.ticketCode,
      this.price,
      this.cancellationPolicy,
      this.baggagePolicy,
      this.status});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketCode = json['ticketCode'];
    price = json['price'];
    cancellationPolicy = json['cancellationPolicy'];
    baggagePolicy = json['baggagePolicy'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticketCode'] = this.ticketCode;
    data['price'] = this.price;
    data['cancellationPolicy'] = this.cancellationPolicy;
    data['baggagePolicy'] = this.baggagePolicy;
    data['status'] = this.status;
    return data;
  }
}
