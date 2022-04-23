class BookingDetailResponse {
  String? _code;
  String? _message;
  late List<Data> _data;

  List<Data> get customerBookingDetails => _data;

  BookingDetailResponse({required code, required message, required data}) {
    _code = code;
    _message = message;
    _data = data;
  }
  BookingDetailResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
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

class Data {
  String? id;
  FlightTicket? flightTicket;
  Customer? customer;
  String? bookingDate;
  String? bookingTime;
  int? numberOfTraveller;
  int? totalPrice;
  String? status;
  List<PassengerLists>? passengerLists;

  Data(
      {this.id,
      this.flightTicket,
      this.customer,
      this.bookingDate,
      this.bookingTime,
      this.numberOfTraveller,
      this.totalPrice,
      this.status,
      this.passengerLists});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['passengerLists'] != null) {
      passengerLists = <PassengerLists>[];
      json['passengerLists'].forEach((v) {
        passengerLists!.add(new PassengerLists.fromJson(v));
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
    if (this.passengerLists != null) {
      data['passengerLists'] =
          this.passengerLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FlightTicket {
  String? id;
  Tickets? ticket;
  Detail? detail;

  FlightTicket({this.id, this.ticket, this.detail});

  FlightTicket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticket =
        json['ticket'] != null ? new Tickets.fromJson(json['ticket']) : null;
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
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

class Detail {
  String? id;
  String? flightCode;
  String? departureDate;
  String? departureTime;
  int? numberOfAvailableSeats;
  Sector? sector;
  Company? company;
  String? status;

  Detail(
      {this.id,
      this.flightCode,
      this.departureDate,
      this.departureTime,
      this.numberOfAvailableSeats,
      this.sector,
      this.company,
      this.status});

  Detail.fromJson(Map<String, dynamic> json) {
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

class Company {
  String? id;
  String? name;
  String? address;
  String? email;
  String? phoneNumber;
  String? contractDate;
  String? contractStatus;

  Company(
      {this.id,
      this.name,
      this.address,
      this.email,
      this.phoneNumber,
      this.contractDate,
      this.contractStatus});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    contractDate = json['contractDate'];
    contractStatus = json['contractStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['contractDate'] = this.contractDate;
    data['contractStatus'] = this.contractStatus;
    return data;
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? email;
  String? username;
  String? phoneNumber;
  String? password;
  String? status;
  List<Null>? roles;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.username,
      this.phoneNumber,
      this.password,
      this.status,
      this.roles});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['status'] = this.status;
    return data;
  }
}

class PassengerLists {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  Bookings? booking;

  PassengerLists(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.booking});

  PassengerLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    phoneNumber = json['phoneNumber'];
    booking =
        json['booking'] != null ? new Bookings.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['phoneNumber'] = this.phoneNumber;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Bookings {
  String? id;
  FlightTicket? flightTicket;
  Customer? customer;
  String? bookingDate;
  String? bookingTime;
  int? numberOfTraveller;
  int? totalTicketPrice;
  String? status;

  Bookings(
      {this.id,
      this.flightTicket,
      this.customer,
      this.bookingDate,
      this.bookingTime,
      this.numberOfTraveller,
      this.totalTicketPrice,
      this.status});

  Bookings.fromJson(Map<String, dynamic> json) {
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
