class Note {
  String title;
  String text;
  int tcases;
  int tdeaths;
  int trecovered;
  int todaycases;
  int todaydeaths;
  int todayrecovered;
  int activecases;
  Note(this.title, this.text, this.tcases, this.tdeaths, this.trecovered, this.todaycases, this.todaydeaths, this.todayrecovered, this.activecases);

  Note.fromJson(Map<String, dynamic> json) {
    var dup = json['countryInfo'];
    title = dup['flag'];
    text = json['country'];
    tcases = json['cases'];
    tdeaths = json['deaths'];
    trecovered = json['recovered'];
    todaycases = json['todayCases'];
    todaydeaths = json['todayDeaths'];
    todayrecovered = json['todayRecovered'];
    activecases = json['active'];
  }
}