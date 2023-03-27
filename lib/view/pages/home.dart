import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/controller/app_controller.dart';
import 'package:weather/view/components/card.dart';
import 'package:weather/view/components/chart.dart';
import 'package:weather/view/components/search.dart';
import '../../constant/images.dart';
import '../components/lists.dart';

class HomeScreen extends GetView<AppController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body:
      GetBuilder<AppController>(
          builder: (controller) {
            return
              controller.city != null && controller.fiveDaysData != null && controller.currentWeatherData != null && controller.dataList != null &&controller.currentWeatherData.main != null &&
                   controller.currentWeatherData.name != null && controller.currentWeatherData.main!.tempMax != null &&controller.currentWeatherData.main!.temp != null && controller.currentWeatherData.main!.tempMin != null?
            ListView(
              children: [
                Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Image.asset(Images.homeImage,fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Search(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MyCard(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.only(top: 120),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'other city'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                      fontSize: 16,
                                      fontFamily: 'flutterfonts',
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              MyList(),
                              Container(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Last Five days'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.bar_chart,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              MyChart(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ):
                  //loadImage
             Center(child: LottieBuilder.asset(Images.loadImage),);
          }
      ),
    );
  }
}
