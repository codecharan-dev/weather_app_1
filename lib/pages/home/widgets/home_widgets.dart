import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_1/bloc/weather_bloc.dart';
import 'package:weather_app_1/pages/widgets/global_text.dart';


AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
  );
}

Widget reusablePurpleCircle() {
  return Container(
    height: 240.h,
    width: 240.w,
    decoration: const BoxDecoration(
      color: Colors.deepPurple,
      shape: BoxShape.circle,
    ),
  );
}

Widget paleOrangeSquare() {
  return Positioned(
    top: 10.h,
    left: 35.w,
    right: 35.w,
    child: Container(
      height: 200.h,
      width: 290.w,
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
      ),
    ),
  );
}

String getWeatherIcons({required int code}) {
  if (code > 200 && code < 300) {
    return "assets/images/thunder_storm.png";
  } else if (code > 300 && code < 500) {
    return "assets/images/drizzling.png";
  } else if (code > 500 && code < 600) {
    return "assets/images/rainy.png";
  } else if (code > 600 && code <= 700) {
    return "assets/images/snow.png";
  } else if (code > 700 && code < 800) {
    return "assets/images/mist.png";
  } else if (code == 800) {
    return "assets/images/clear_sky.png";
  } else {
    return "assets/images/white_cloud.png";
  }
}
BlocBuilder<WeatherBloc, WeatherState> cloudImageToDayDateAndTimeContainer() {
  return BlocBuilder<WeatherBloc, WeatherState>(
    builder: (context, state) {
      if (state is WeatherSuccessState) {
        return Container(
          margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 70), 
          // color: Colors.pink,
          //height: 100.h,
          width: 360.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              globalText(
                text: "📍 ${state.weather.areaName}",
                textColor: Colors.white,
                textFontSize: 13.sp,
                textFontWeight: FontWeight.normal,
              ),
              SizedBox(height: 8.h),
              globalText(
                text: "Good Morning",
                textColor: Colors.white,
                textFontSize: 22.sp,
                textFontWeight: FontWeight.bold,
              ),
              Container(
                margin: EdgeInsets.only(top: 30.h),
                height: 150.h,
                width: 350.w,
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  image: DecorationImage(
        
                    image: AssetImage(
                     getWeatherIcons(code:state.weather.weatherConditionCode!)
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: globalText(
                  text: "${state.weather.temperature!.celsius!.round()}°C", // Option + Shift + 8 keys press this for degree symbol (°)
                  textColor: Colors.white,
                  textFontSize: 40.sp,
                  textFontWeight: FontWeight.bold,
                ),
              ),
              //SizedBox(height: 10.h),
              Center(
                child: globalText(
                  text: state.weather.weatherMain!.toUpperCase(),
                  textColor: Colors.white,
                  textFontSize: 25.sp,
                  textFontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: globalText(
                  text: DateFormat().format(state.weather.date!),
                  textColor: Colors.white,
                  textFontSize: 15.sp,
                  textFontWeight: FontWeight.normal,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.h),
                child: Column(
                  children: [
                    Container(
                      height: 70.h,
                      width: 300.w,
                      decoration: const BoxDecoration(
                        // color: Colors.pink,
                        border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              reusableFourImage(
                                imagePath: "assets/images/sun_1.png",
                              ),
                              SizedBox(width: 10.w),
                              reusableFourTextColumn(
                                sunrise: "Sunrise",
                                time: DateFormat("").add_jm().format(state.weather.sunrise!),
                              ),
                              SizedBox(width: 63.w),
                              reusableFourImage(
                                imagePath: "assets/images/moon_1.png",
                              ),
                              SizedBox(width: 10.w),
                              reusableFourTextColumn(
                                sunrise: "Sunset", // *** Here, consider property sunrise as sunset, sorry for the in convinence ***
                                time: DateFormat("").add_jm().format(state.weather.sunset!),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                      width: 300.w,
                      // color: Colors.pink,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              reusableFourImage(
                                imagePath: "assets/images/hot_temp_1.png",
                              ),
                              SizedBox(width: 10.w),
                              reusableFourTextColumn(
                                sunrise: "Max Temp",
                                time: "${state.weather.tempMax!.celsius!.round()}°C", // *** Here, consider property name time as temp, sorry for the in convinence ***
                              ),
                              SizedBox(width: 63.w),
                              reusableFourImage(
                                imagePath: "assets/images/cold_temp.png",
                              ),
                              SizedBox(width: 10.w),
                              reusableFourTextColumn(
                                sunrise: "Min Temp",
                                time: "${state.weather.tempMin!.celsius!.round()}°C", // *** Here, consider property name time as temp, sorry for the in convinence ***
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}


Widget reusableFourImage({required String imagePath}) {
  return Container(
    height: 55.h,
    width: 55.w,
    decoration: BoxDecoration(
      //color: Colors.black,
      shape: BoxShape.circle,
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
    ),
  );
}

Widget reusableFourTextColumn({required String sunrise, required String time}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      globalText(
        text: sunrise,
        textColor: Colors.grey.withOpacity(0.9),
        textFontSize: 11.sp,
        textFontWeight: FontWeight.normal,
      ),
      globalText(
        text: time,
        textColor: Colors.white,
        textFontSize: 10.sp,
        textFontWeight: FontWeight.bold,
      ),
    ],
  );
}


