class MainWeather
{

  double temp ;
  double feels_like ;
  double temp_min ;
  double temp_max ;
  double pressure ;
  double humidity ;
  double sea_level ;
  double grnd_level ;

  MainWeather(
      {
        required this.temp,
        required this.feels_like,
        required this.temp_min,
        required this.temp_max,
        required this.pressure,
        required this.humidity,
        required this.sea_level,
        required this.grnd_level
      });

  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: double.parse(json["temp"]),
      feels_like: double.parse(json["feels_like"]),
      temp_min: double.parse(json["temp_min"]),
      temp_max: double.parse(json["temp_max"]),
      pressure: double.parse(json["pressure"]),
      humidity: double.parse(json["humidity"]),
      sea_level: double.parse(json["sea_level"]),
      grnd_level: double.parse(json["grnd_level"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "feels_like": feels_like,
      "temp_min": temp_min,
      "temp_max": temp_max,
      "pressure": pressure,
      "humidity": humidity,
      "sea_level": sea_level,
      "grnd_level": grnd_level,
    };
  }
}