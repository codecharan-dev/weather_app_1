part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitialState extends WeatherState {}

final class WeatherLoadingState extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final Weather weather;

  const WeatherSuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}

final class WeatherFailueState extends WeatherState {}
