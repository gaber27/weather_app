import 'package:get/get.dart';
import 'package:weather/constant/api.dart';
import 'package:weather/controller/app_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AppController(city));
  }
}