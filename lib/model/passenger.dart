import 'booking.dart';
import 'booking_details.dart';

class Passenger {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phoneNumber;
  Booking? booking;

  Passenger(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.phoneNumber,
      this.booking});

  Passenger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    phoneNumber = json['phoneNumber'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
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
