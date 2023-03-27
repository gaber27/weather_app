import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather/model/Last_Five.dart';
import 'package:weather/model/current_weather.dart';
import 'package:weather/network/service.dart';


class AppController extends GetxController {
  String? city;
  CurrentWeather currentWeatherData = CurrentWeather();
  List<CurrentWeather> dataList = [];
  List<LastFiveDays> fiveDaysData = [];

  AppController({required this.city});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: '$city').getCurrentTemp(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) => {
          print(error),
          update(),
        });
  }

  void getTopFiveCities() {
    List<String> cities = [
      'alexandria',
      'cairo',
      'Giza',
      'Sohag',
      'fayoum'
    ];
    cities.forEach((city) {
      WeatherService(city: '$city').getCurrentTemp(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() {
    WeatherService(city: '$city').getLastFiveDays(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }
}
