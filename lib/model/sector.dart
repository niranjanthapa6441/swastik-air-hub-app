class SectorAPIResponse {
  String? code;
  String? message;
  List<Sector>? data;

  SectorAPIResponse({this.code, this.message, this.data});

  SectorAPIResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Sector>[];
      json['data'].forEach((v) {
        data!.add(new Sector.fromJson(v));
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
