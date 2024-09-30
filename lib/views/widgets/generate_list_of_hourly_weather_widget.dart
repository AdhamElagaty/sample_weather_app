import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/hourly_forcast_model.dart';
import 'package:sample_weather_app/views/widgets/hourly_weather_widget.dart';

class GenerateListOfHourlyWeatherWidget extends StatelessWidget {
  const GenerateListOfHourlyWeatherWidget({
    super.key,
    required this.hourlyForecasts,
  });

  final List<HourlyForecastModel> hourlyForecasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyForecasts.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return HourlyWeatherWidget(hourlyForecast: hourlyForecasts[index]);
        },
      ),
    );
  }
}
