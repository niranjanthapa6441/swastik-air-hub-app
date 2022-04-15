class BookingRequest {
  String flightCode;
  String ticketCode;
  String customerId;
  int numberOfTraveller;
  String status;
  int totalTicketPrice;
  List<PassengerRequest>? passengerList;
  String paymentMethod;
  String paymentStatus;
  int paidAmount;
  String paidVia;
  BookingRequest(
      {required this.customerId,
      required this.flightCode,
      required this.ticketCode,
      required this.numberOfTraveller,
      required this.passengerList,
      required this.status,
      required this.totalTicketPrice,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.paidAmount,
      required this.paidVia});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['flightCode'] = this.flightCode;
    data['ticketCode'] = this.ticketCode;
    data['numberOfTraveller'] = this.numberOfTraveller;
    data['status'] = this.status;
    data['totalTicketPrice'] = this.totalTicketPrice;
    if (this.passengerList != null) {
      data['passengerList'] =
          this.passengerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PassengerRequest {
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  int? id;

  PassengerRequest(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleName'] = this.middleName;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
