class Note1 {
  String stateName;
  int total;
  int active;
  int cured;
  int deaths;
  String id;
  var district;
  Note1(this.stateName, this.id, this.total, this.active, this.deaths, this.cured, this.district);

  Note1.fromJson(Map<String, dynamic> json) {
    stateName = json['state'];
    total = json['confirmed'];
    active = json['active'];
    cured = json['recovered'];
    deaths = json['deaths'];
    id = json['id'];
    district = json['districtData'];
  }
}