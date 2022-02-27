class SearchFLightAPIResponse {
  String? code;
  String? message;
  List<SearchFlightModel>? data;

  SearchFLightAPIResponse({this.code, this.message, this.data});

  SearchFLightAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SearchFlightModel>[];
      json['data'].forEach((v) {
        data!.add(new SearchFlightModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchFlightModel {
  String? flightCode;
  String? departureDate;
  String? departureTime;
  String? sectorCode;
  String? companyName;
  String? status;
  List<Tickets>? tickets;

  SearchFlightModel(
      {this.flightCode,
      this.departureDate,
      this.departureTime,
      this.sectorCode,
      this.companyName,
      this.status,
      this.tickets});

  SearchFlightModel.fromJson(Map<String, dynamic> json) {
    flightCode = json['flightCode'];
    departureDate = json['departureDate'];
    departureTime = json['departureTime'];
    sectorCode = json['sectorCode'];
    companyName = json['companyName'];
    status = json['status'];
    if (json['tickets'] != null) {
      tickets = <Tickets>[];
      json['tickets'].forEach((v) {
        tickets!.add(new Tickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flightCode'] = this.flightCode;
    data['departureDate'] = this.departureDate;
    data['departureTime'] = this.departureTime;
    data['sectorCode'] = this.sectorCode;
    data['companyName'] = this.companyName;
    data['status'] = this.status;
    if (this.tickets != null) {
      data['tickets'] = this.tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickets {
  int? id;
  String? ticketCode;
  int? price;
  String? status;

  Tickets({this.id, this.ticketCode, this.price, this.status});

  Tickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketCode = json['ticketCode'];
    price = json['price'];
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
