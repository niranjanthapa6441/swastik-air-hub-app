class SearchFlightResponse {
  String? _code;
  String? _message;
  late List<SearchFlightModel> _data;
  List<SearchFlightModel> get availableFlightDetail => _data;
  String? get code => _code;
  String? get message => _message;
  SearchFlightResponse({required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  SearchFlightResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <SearchFlightModel>[];
      json['data'].forEach((v) {
        _data.add(SearchFlightModel.fromJson(v));
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

class SearchFlightModel {
  String? flightCode;
  String? departureDate;
  String? departureTime;
  Sector? sector;
  String? companyName;
  String? status;
  Ticket? ticket;

  SearchFlightModel(
      {this.flightCode,
      this.departureDate,
      this.departureTime,
      this.sector,
      this.companyName,
      this.status,
      this.ticket});

  SearchFlightModel.fromJson(Map<String, dynamic> json) {
    flightCode = json['flightCode'];
    departureDate = json['departureDate'];
    departureTime = json['departureTime'];
    sector =
        json['sector'] != null ? new Sector.fromJson(json['sector']) : null;
    companyName = 'Buddha Airlines';
    status = json['status'];
    ticket =
        json['ticket'] != null ? new Ticket.fromJson(json['ticket']) : null;
  }
  SearchFlightModel.fromNepalAirlinesJson(Map<String, dynamic> json) {
    flightCode = json['flight_code'];
    departureDate = json['departure_date'];
    departureTime = json['departure_time'];
    sector = json['sector'] != null
        ? new Sector.fromNepalAirlinesJson(json['sector'])
        : null;
    companyName = 'Nepal Airlines';
    status = json['status'];
    ticket = json['ticket'] != null
        ? new Ticket.fromNepalAirlinesJson(json['ticket'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightCode'] = this.flightCode;
    data['departureDate'] = this.departureDate;
    data['departureTime'] = this.departureTime;
    if (this.sector != null) {
      data['sector'] = this.sector!.toJson();
    }
    data['companyName'] = this.companyName;
    data['status'] = this.status;
    if (this.ticket != null) {
      data['ticket'] = this.ticket!.toJson();
    }
    return data;
  }
}

class Sector {
  String? id;
  String? sectorCode;
  String? from;
  String? to;
  String? duration;
  String? status;

  Sector(
      {this.id,
      this.sectorCode,
      this.from,
      this.to,
      this.duration,
      this.status});

  Sector.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectorCode = json['sectorCode'];
    from = json['from'];
    to = json['to'];
    duration = json['duration'];
    status = json['status'];
  }
  Sector.fromNepalAirlinesJson(Map<String, dynamic> json) {
    id = json['id'];
    sectorCode = json['sector_code'];
    to = json['arrival'];
    from = json['departure'];
    duration = json['duration'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectorCode'] = this.sectorCode;
    data['from'] = this.from;
    data['to'] = this.to;
    data['duration'] = this.duration;
    data['status'] = this.status;
    return data;
  }
}

class Ticket {
  int? id;
  String? ticketCode;
  int? price;
  String? status;

  Ticket({this.id, this.ticketCode, this.price, this.status});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketCode = json['ticketCode'];
    price = json['price'];
    status = json['status'];
  }
  Ticket.fromNepalAirlinesJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketCode = json['ticket_code'];
    price = json['ticket_price'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticketCode'] = this.ticketCode;
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}
