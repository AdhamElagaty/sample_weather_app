import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/views/widgets/weather_hourly_today_widget.dart';
import 'package:sample_weather_app/views/widgets/weather_every_day_widget.dart';
import 'package:sample_weather_app/views/widgets/weather_detail_widget.dart';

class WeatherExtraInformationWidget extends StatelessWidget {
  const WeatherExtraInformationWidget({
    super.key,
    required this.weather,
  });

  final WeatherResponseModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 6),
          WeatherHourlyTodayWidget(
            hourlyForecasts: weather.forecast.forecastDays[0].hourly!,
          ),
          const SizedBox(height: 6),
          const Divider(
            color: Color.fromARGB(202, 81, 65, 203),
          ),
          WeatherEveryDayWidget(forecastDays: weather.forecast.forecastDays),
          const SizedBox(height: 6),
          const Divider(
            color: Color.fromARGB(202, 81, 65, 203),
          ),
          WeatherDetailWidget(weather: weather.current),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
