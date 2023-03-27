import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weather/constant/colors.dart';
import '../../controller/app_controller.dart';

class Search extends GetView<AppController>
{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.only(top: 60, left: 20, right: 20),
      child: TextField(
        onChanged: (value) =>
        controller.city = value,
        style: TextStyle(
          color: whiteColor,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) => controller.updateWeather(),
        decoration: InputDecoration(
          suffix: Icon(
            Icons.search,
            color: whiteColor,
          ),
          hintStyle: TextStyle(color: whiteColor),
          hintText: 'Search'.toUpperCase(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: whiteColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: whiteColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: whiteColor),
          ),
        ),
      ),
    );
  }
}