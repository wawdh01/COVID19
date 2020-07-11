class Note3 {
  int cases;
  int deaths;
  int recovered;
  int active;
  Note3(this.cases, this.deaths, this.recovered, this.active);

  Note3.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['']['active'];
  }
}