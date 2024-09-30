import 'package:sample_weather_app/models/condition_model.dart';

class CurrentWeatherModel {
  final double tempC;
  final double feelslikeC;
  final int humidity;
  final double visibilityKm;
  final double uv;
  final ConditionModel condition;

  const CurrentWeatherModel({
    required this.tempC,
    required this.feelslikeC,
    required this.humidity,
    required this.visibilityKm,
    required this.uv,
    required this.condition,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: json['temp_c'].toDouble(),
      feelslikeC: json['feelslike_c'].toDouble(),
      humidity: json['humidity'],
      visibilityKm: json['vis_km'].toDouble(),
      uv: json['uv'].toDouble(),
      condition: ConditionModel.fromJson(json['condition']),
    );
  }
}
