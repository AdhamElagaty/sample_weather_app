import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/daily_forecast_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';

class CurrentWeatherMaxMinTempWidget extends StatelessWidget {
  const CurrentWeatherMaxMinTempWidget({
    super.key,
    required this.dailyForecast,
  });

  final DailyForecastModel dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.keyboard_arrow_up,
          color: Color(0xff9F9F9F),
        ),
        Text(
          "${dailyForecast.maxTempC}\u00B0",
          style:
              AppStyle.styleRegular14.copyWith(color: const Color(0xff575757)),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xff9F9F9F),
        ),
        Text(
          "${dailyForecast.minTempC}\u00B0",
          style:
              AppStyle.styleRegular14.copyWith(color: const Color(0xff575757)),
        ),
      ],
    );
  }
}
