import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/utils/binding/app_binding.dart';
import 'package:weather/view/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
      name: '/',
      page: () => SplashScreen(),
      binding: AppBinding(),
    )

      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: splashColor,
        scaffoldBackgroundColor: splashColor,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: splashColor,
          elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: splashColor,
            statusBarIconBrightness: Brightness.light
        )
        ),),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
    );
  }
}

