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

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.username,
      this.phoneNumber,
      this.password,
      this.status});

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
