import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/models/daily_forecast_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/utils/helper.dart';
import 'package:simple_shadow/simple_shadow.dart';

class WeatherDayWidget extends StatelessWidget {
  const WeatherDayWidget({
    super.key,
    required this.forecastDay,
  });

  final DailyForecastModel forecastDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Helper.formatDateV1(forecastDay.date),
            style: AppStyle.styleRegular14,
          ),
          Row(
            children: [
              Text(
                "${forecastDay.maxTempC}\u00B0",
                style: AppStyle.styleMedium14,
              ),
              const SizedBox(width: 16),
              Text(
                "${forecastDay.minTempC}\u00B0",
                style: AppStyle.styleRegular14,
              ),
              const SizedBox(width: 16),
              SimpleShadow(
                opacity: 0.45,
                offset: const Offset(6, 8),
                sigma: 10,
                child: SvgPicture.asset(
                  forecastDay.condition.imagePath,
                  height: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
