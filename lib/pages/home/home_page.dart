import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_1/pages/home/widgets/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: homeAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 170.h,
            right: -10.w,
            child: reusablePurpleCircle(),
          ),
          Positioned(
            top: 170.h,
            left: -10.w,
            child: reusablePurpleCircle(),
          ),
          paleOrangeSquare(),
          // BackdropFilter is used for gradient in this project.
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 95.0,
              sigmaY: 100.0,
            ),
            child: Container(
              color: Colors.transparent,
              //decoration: BoxDecoration(color: Colors.transparent),
            ),
          ),
          cloudImageToDayDateAndTimeContainer(),
        ],
      ),
    );
  }
}

//  Place Name: San Francisco [US] (37.7858, -122.4064)
//  Date: 2024-03-09 10:14:12.000
//  Weather: Clouds, few clouds
//  Temp: 11.2 Celsius, 
//  Temp (min): 8.9 Celsius, 
//  Temp (max): 13.2 Celsius, 
//  Temp (feels like): 10.5 Celsius
//  Sunrise: 2024-03-08 20:00:24.000, 
//  Sunset: 2024-03-09 07:40:20.000
//  Wind: speed 7.72, 
//  degree: 280.0, 
//  gust null
//  Weather Condition code: 801