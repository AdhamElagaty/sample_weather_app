import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/daily_forecast_model.dart';
import 'package:sample_weather_app/views/widgets/weather_day_widget.dart';

class WeatherEveryDayWidget extends StatelessWidget {
  const WeatherEveryDayWidget({
    super.key,
    required this.forecastDays,
  });

  final List<DailyForecastModel> forecastDays;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Every day',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 6),
        ..._buildWeatherWidgets(forecastDays),
      ],
    );
  }

  List<Widget> _buildWeatherWidgets(List<DailyForecastModel> forecastDays) {
    List<Widget> weatherWidgets = forecastDays.map((day) {
      return WeatherDayWidget(
        forecastDay: day,
      );
    }).toList();
    return weatherWidgets;
  }
}
