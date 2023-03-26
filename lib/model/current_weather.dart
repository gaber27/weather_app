import 'package:weather/model/clouds.dart';
import 'package:weather/model/coord.dart';
import 'package:weather/model/main.dart';
import 'package:weather/model/sys.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/model/wind.dart';

class CurrentWeather
{
    Coord coord ;
    List <Weather> weather ;
    String base;
    MainWeather mainWeather ;
    int visibility;
    Wind wind ;
    Clouds clouds;
    int dt ;
    Sys sys ;
    int timezone;
    int id;
    int cod;
    String name ;

    CurrentWeather(
      {
        required this.coord,
        required this.weather,
        required this.base,
        required this.mainWeather,
        required this.visibility,
        required this.wind,
        required this.clouds,
        required this.dt,
        required this.sys,
        required this.timezone,
        required this.id,
        required this.cod,
        required this.name
      });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: Coord.fromJson(json["coord"]),
      weather: List<Weather>.of(json["weather"]).map((i) => i).toList(),
      base: json["base"],
      mainWeather: MainWeather.fromJson(json["mainWeather"]),
      visibility: int.parse(json["visibility"]),
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: int.parse(json["dt"]),
      sys: Sys.fromJson(json["sys"]),
      timezone: int.parse(json["timezone"]),
      id: int.parse(json["id"]),
      cod: int.parse(json["cod"]),
      name: json["name"],
    );
  }
//
}