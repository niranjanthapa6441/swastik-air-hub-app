class SectorAPIResponse {
  String? _code;
  String? _message;
  late List<Sector> _data;
  List<Sector> get sectors => _data;
  String? get message => _message;

  SectorAPIResponse({required code, required message, required data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  SectorAPIResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Sector>[];
      json['data'].forEach((v) {
        _data.add(new Sector.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this.message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
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
