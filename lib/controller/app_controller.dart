
import 'package:get/get.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/network/service.dart';

import '../constant/api.dart';
import '../model/Last_Five.dart';

class AppController extends GetxController 
{
  String city ;

  AppController(this.city);

  CurrentWeather ? currentWeather ;
  List<LastFiveDays>  lastFive = [] ;
  List<CurrentWeather>  FiveCurrentWeathe = [] ;

  @override
  void onInit()
  {
    initState();
    getFivesCites();
    super.onInit();
  }

  void updateTemp()
  {
    initState();
  }

  void initState()
  {
        getCurrentTemp();
        getLastFiveTemp();
  }

  void getCurrentTemp()
  {
    WeatherService(city: city).getCurrentTemp(
        onSuccess: (data)
        {
          currentWeather =data ;
          update();
        },
        onError: (e){
          Get.snackbar(
            'error',
            'some thing missed',
            duration: Duration(milliseconds: 3),
          );
          print(e.toString());
          update();
        }
    );
  }


  void getFivesCites() {
    List<String> cities = [
      'Cairo',
      'Alexandria',
      'Gize',
      'Sohag',
      'Fayoum'
    ];

    cities.forEach((ele) {

      FiveCurrentWeathe.add(ele as CurrentWeather);

      WeatherService(city: city).getCurrentTemp(
          onSuccess: (data)
          {
            currentWeather =data ;
            update();
          },
          onError: (e){
            Get.snackbar(
              'error',
              'some thing missed',
              duration: Duration(milliseconds: 3),
            );
            print(e.toString());
            update();
          }
      );
    });


  }

  void getLastFiveTemp() {
    WeatherService(city: city).getLastFiveDays(
        onSuccess: (data)
        {
          lastFive =data as List<LastFiveDays> ;
          update();
        },
        onError: (e){
          Get.snackbar(
            'error',
            'some thing missed',
            duration: Duration(milliseconds: 3),
          );
          print(e.toString());
          update();
        }
    );

  }
  
}