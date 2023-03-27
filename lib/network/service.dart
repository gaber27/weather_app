import 'package:weather/constant/api.dart';
import 'package:weather/model/Last_Five.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/network/dio.dart';

class WeatherService
{
  String city ;
  String baseUrl = 'https://api.openweathermap.org/data/2.5';

  WeatherService({required this.city});

  // Function To Get Current Temp in City

  void getCurrentTemp({
   Function() ? beforeSend ,
   Function(CurrentWeather currentWeather)? onSuccess ,
   Function(dynamic error)? onError ,
})
  {


    /// This is Url for current Temp
    final url = '$baseUrlCurrent$city&lang=en&$apiKey';
      DioHelper(url: url).getDate(
        beforeSend: ()=>
        {
          if(beforeSend != null)
          {
            print(url),
            beforeSend()
          }
        },
        onSuccess: (data) =>
        {
          onSuccess!(CurrentWeather.fromJson(data)),
        },
        onError: (e)=>
    {
      if(onError != null)
      {
        onError(e),
      }

    }

      );
  }
  void getLastFiveDays({
    Function()? beforeSend,
    Function(List<LastFiveDays> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
})
  {


    /// This is Url for current Temp
    final url = '$baseUrlLast$city&lang=en&$apiKey';
      DioHelper(url: '$url' ).getDate(
          beforeSend: ()=>{},
        onSuccess: (data)=>
        {
          onSuccess!((data['list'] as List).map((t) => LastFiveDays.fromJson(t))
            .toList())
        },
          onError: (error) =>
          {
            print(error),
            onError!(error),
          }
      );
  }
}