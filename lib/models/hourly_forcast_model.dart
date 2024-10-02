import 'package:sample_weather_app/models/condition_model.dart';

class HourlyForecastModel {
  final DateTime time;
  final double tempC;
  final ConditionModel condition;

  HourlyForecastModel({
    required this.time,
    required this.tempC,
    required this.condition,
  });

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    return HourlyForecastModel(
      time: DateTime.parse(json['time']),
      tempC: json['temp_c'].toDouble(),
      condition: ConditionModel.fromJson(json['condition']),
    );
  }
}
