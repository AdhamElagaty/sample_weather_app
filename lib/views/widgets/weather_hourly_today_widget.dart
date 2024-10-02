import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/hourly_forcast_model.dart';
import 'package:sample_weather_app/views/widgets/generate_list_of_hourly_weather_widget.dart';

class WeatherHourlyTodayWidget extends StatelessWidget {
  const WeatherHourlyTodayWidget({
    super.key,
    required this.hourlyForecasts,
  });

  final List<HourlyForecastModel> hourlyForecasts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 12),
        GenerateListOfHourlyWeatherWidget(
          hourlyForecasts: hourlyForecasts,
        ),
      ],
    );
  }
}
