import 'package:sample_weather_app/models/daily_forecast_model.dart';

class ForecastModel {
  final List<DailyForecastModel> forecastDays;

  ForecastModel({required this.forecastDays});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastDays: (json['forecastday'] as List)
          .map((dayJson) => DailyForecastModel.fromJson(dayJson))
          .toList(),
    );
  }
}
