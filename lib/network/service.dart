import 'package:weather/constant/api.dart';
import 'package:weather/model/Last_Five.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/network/dio.dart';

class WeatherService
{
  String city ;

  WeatherService({required this.city});

  // Function To Get Current Temp in City

  void getCurrentTemp({
  required Function() beforSend ,
  required Function(CurrentWeather ? currentWeather) onSuccess ,
  required Function(dynamic error) onError ,
})
  {
      // This is Url for current Temp
    final url = "$baseUrlCurrent$city&$apiKey";
      DioHelper().getDate(
        beforSend: ()=> beforSend(),
          onSuccess: (data)=>onSuccess(CurrentWeather.fromJson(data)),
          onError: (e)=>onError(e),
          url: url
      );
  }
  void getLastFiveDays({
  required Function() beforSend ,
  required Function(CurrentWeather ? currentWeather) onSuccess ,
  required Function(dynamic error) onError ,
})
  {
      // This is Url for current Temp
    final url = "$baseUrlLast$city&$apiKey";
      DioHelper().getDate(
        beforSend: ()=> beforSend(),
          onSuccess: (data)=>onSuccess((data['list']).map((ittem)=>LastFiveDays.fromJson(ittem)).toList() ?? List.empty()),
          onError: (e)=>onError(e),
          url: url
      );
  }
}