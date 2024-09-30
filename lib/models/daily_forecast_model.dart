import 'package:sample_weather_app/models/condition_model.dart';
import 'package:sample_weather_app/models/hourly_forcast_model.dart';

class DailyForecastModel {
  final DateTime date;
  final double maxTempC;
  final double minTempC;
  final ConditionModel condition;
  final double uv;
  final List<HourlyForecastModel>?
      hourly; // Optional because not all days have hourly data

  DailyForecastModel({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
    required this.uv,
    this.hourly,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    List<HourlyForecastModel>? hourlyData;
    if (json.containsKey('hour')) {
      hourlyData = (json['hour'] as List)
          .map((hourJson) => HourlyForecastModel.fromJson(hourJson))
          .toList();
    }

    return DailyForecastModel(
      date: DateTime.parse(json['date']),
      maxTempC: json['day']['maxtemp_c'].toDouble(),
      minTempC: json['day']['mintemp_c'].toDouble(),
      condition: ConditionModel.fromJson(json['day']['condition']),
      uv: json['day']['uv'].toDouble(),
      hourly: hourlyData,
    );
  }
}
