import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_1/data/my_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeatherEvent>(fetchWeatherEvent);
  }

  FutureOr<void> fetchWeatherEvent( FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      WeatherFactory wf = WeatherFactory(MyData.apiKey, language: Language.ENGLISH);
      Weather weatherr = await wf.currentWeatherByLocation(
        event.position.latitude,
        event.position.longitude,
      );
      print(weatherr);
      emit(WeatherSuccessState(weather: weatherr));
    } catch (e) {
      emit(WeatherFailueState());
    }
  }
}
