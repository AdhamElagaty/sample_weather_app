import 'package:sample_weather_app/models/current_weather_model.dart';
import 'package:sample_weather_app/models/forecast_model.dart';
import 'package:sample_weather_app/models/location_model.dart';

class WeatherResponseModel {
  final LocationModel location;
  final CurrentWeatherModel current;
  final ForecastModel forecast;

  WeatherResponseModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherResponseModel.fromJson(
      Map<String, dynamic> json, LocationModel location) {
    return WeatherResponseModel(
      location: location,
      current: CurrentWeatherModel.fromJson(json['current']),
      forecast: ForecastModel.fromJson(json['forecast']),
    );
  }
}
