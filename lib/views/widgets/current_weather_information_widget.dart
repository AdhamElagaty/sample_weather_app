import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/widgets/current_weather_max_min_widget.dart';

class CurrentWeatherInformationWidget extends StatelessWidget {
  const CurrentWeatherInformationWidget({
    super.key,
    required this.weather,
  });

  final WeatherResponseModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.current.condition.text,
                  style: AppStyle.styleBold22.copyWith(
                    color: const Color(0xff9F93FF),
                    fontSize: 24,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${weather.current.tempC}\u00B0",
                  style: AppStyle.styleSemiBold72,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10), // Add some spacing between columns
          CurrentWeatherMaxMinTempWidget(
            dailyForecast: weather.forecast.forecastDays[0],
          ),
        ],
      ),
    );
  }
}
