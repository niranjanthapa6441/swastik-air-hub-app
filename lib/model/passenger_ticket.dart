class PassengerTicketResponse {
  String? _code;
  String? _message;
  late List<PassengerTicket> _data;

  List<PassengerTicket> get passengerTicketDetails => _data;

  PassengerTicketResponse({required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  PassengerTicketResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <PassengerTicket>[];
      json['data'].forEach((v) {
        _data.add(PassengerTicket.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = _code;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PassengerTicket {
  String? departure;
  String? arrival;
  String? passengerName;
  String? flightCode;
  String? departureDate;
  String? departureTime;
  String? ticketNumber;
  int? ticketPrice;
  String? sectorCode;

  PassengerTicket(
      {this.departure,
      this.arrival,
      this.passengerName,
      this.flightCode,
      this.departureDate,
      this.departureTime,
      this.ticketNumber,
      this.ticketPrice,
      this.sectorCode});

  PassengerTicket.fromJson(Map<String, dynamic> json) {
    departure = json['departure'];
    arrival = json['arrival'];
    passengerName = json['passengerName'];
    flightCode = json['flightCode'];
    departureDate = json['departureDate'];
    departureTime = json['departureTime'];
    ticketNumber = json['ticketNumber'];
    ticketPrice = json['ticketPrice'];
    sectorCode = json['sectorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departure'] = this.departure;
    data['arrival'] = this.arrival;
    data['passengerName'] = this.passengerName;
    data['flightCode'] = this.flightCode;
    data['departureDate'] = this.departureDate;
    data['departureTime'] = this.departureTime;
    data['ticketNumber'] = this.ticketNumber;
    data['ticketPrice'] = this.ticketPrice;
    data['sectorCode'] = this.sectorCode;
    return data;
  }
}
