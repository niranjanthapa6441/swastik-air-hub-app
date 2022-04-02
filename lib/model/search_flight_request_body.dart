class SearchFlightRequestBody{
  String sectorCode;
  String departureDate;
  int numberOfTraveller;
  SearchFlightRequestBody({required this.sectorCode, required this.departureDate, required this.numberOfTraveller});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectorCode'] = this.sectorCode;
    data['departureDate'] = this.departureDate;
    data['numberOfTraveller'] = this.numberOfTraveller;
    return data;
  }
}