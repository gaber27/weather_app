import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/controller/app_controller.dart';
import 'package:weather/view/components/search.dart';

import '../../constant/images.dart';


class MyCard extends GetView<AppController> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 10,
      width: 10,
      child: OverflowBox(
        minWidth: 0.0,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: 0.0,
        maxHeight: (MediaQuery.of(context).size.height / 3),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: double.infinity,
              child: Card(
                color: whiteColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              '${controller.currentWeatherData.name}'
                                  .toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                color: Colors.black45,
                                fontSize: 24,
                                fontWeight:
                                FontWeight.bold,
                                fontFamily:
                                'flutterfonts',
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              DateFormat()
                                  .add_MMMMEEEEd()
                                  .format(DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                color: Colors.black45,
                                fontSize: 16,
                                fontFamily:
                                'flutterfonts',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '${controller.currentWeatherData.weather![0].description}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: Colors.black45,
                                  fontSize: 22,
                                  fontFamily:
                                  'flutterfonts',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                    color: Colors.black45,
                                    fontFamily:
                                    'flutterfonts'),
                              ),
                              Text(
                                'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!
                                    .tempMax
                                !- 273.15).round().toString()}\u2103',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontFamily:
                                  'flutterfonts',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: LottieBuilder.asset(
                                    Images.cloudlyImage),
                              ),
                              Container(
                                child: Text(
                                  'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                    color: Colors.black45,
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.bold,
                                    fontFamily:
                                    'flutterfonts',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
