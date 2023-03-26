class Sys
{
  int type ;
  int id ;
  int sunrise;
  int sunset;
  String country;

  Sys({required this.type,required this.id,required this.sunrise,required this.sunset,required this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      type: int.parse(json["type"]),
      id: int.parse(json["id"]),
      sunrise: int.parse(json["sunrise"]),
      sunset: int.parse(json["sunset"]),
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "id": id,
      "sunrise": sunrise,
      "sunset": sunset,
      "country": country,
    };
  }

}