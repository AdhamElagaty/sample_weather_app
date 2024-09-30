import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/models/hourly_forcast_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/utils/helper.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    super.key,
    required this.hourlyForecast,
  });

  final HourlyForecastModel hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 58,
      height: 92,
      decoration: BoxDecoration(
        color: const Color.fromARGB(96, 144, 145, 198),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Helper.formatTime(hourlyForecast.time),
              style: AppStyle.styleRegular12
                  .copyWith(color: const Color(0xffD8D8D8)),
            ),
            Text(
              "${hourlyForecast.tempC.toString()}\u00B0",
              style: AppStyle.styleRegular14
                  .copyWith(color: const Color(0xffFFFFFF)),
            ),
            SimpleShadow(
              opacity: 0.45,
              offset: const Offset(6, 8),
              sigma: 10,
              child: SvgPicture.asset(
                hourlyForecast.condition.imagePath,
                height: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
