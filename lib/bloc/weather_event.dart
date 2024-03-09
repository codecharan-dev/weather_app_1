part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

final class FetchWeatherEvent extends WeatherEvent {
  final Position position;

  const FetchWeatherEvent({required this.position});

  @override
  List<Object> get props => [position];
}
