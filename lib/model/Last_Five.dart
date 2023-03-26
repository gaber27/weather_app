class LastFiveDays
{
  String date;
  double temp ;

  LastFiveDays(this.date, this.temp);

  factory LastFiveDays.fromJson(Map<String, dynamic> json) {
    return LastFiveDays(
       json["Date"],
       double.parse(json["temp"]),
    );
  }
 Map<String, dynamic> toJson() {
    return {
      "Date": date,
      "temp": temp,
    };
  }
}