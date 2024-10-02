import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/current_weather_model.dart';
import 'package:sample_weather_app/views/widgets/detail_elment_widget.dart';

class WeatherDetailWidget extends StatelessWidget {
  const WeatherDetailWidget({
    super.key,
    required this.weather,
  });

  final CurrentWeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detail',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailElmentWidget(
                  title: "Real Feel",
                  value: "${weather.feelslikeC}\u00B0",
                ),
                const SizedBox(
                  height: 18,
                ),
                DetailElmentWidget(
                  title: "Humidity",
                  value: "${weather.humidity}%",
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailElmentWidget(
                  title: "Visibility",
                  value: "${weather.visibilityKm}km",
                ),
                const SizedBox(
                  height: 18,
                ),
                DetailElmentWidget(
                  title: "UV Index",
                  value: weather.uv.toString(),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
