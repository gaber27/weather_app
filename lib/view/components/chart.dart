import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather/controller/app_controller.dart';
import 'package:weather/model/Last_Five.dart';

class MyChart extends GetView<AppController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries<LastFiveDays, String>>[
            SplineSeries<LastFiveDays, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (LastFiveDays f, _) =>
              f.dateTime,
              yValueMapper: (LastFiveDays f, _) =>
              f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
