import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/utils/helper.dart';

class WeatherViewHeaderWidget extends StatelessWidget {
  const WeatherViewHeaderWidget({
    super.key,
    required this.weather,
  });

  final WeatherResponseModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const SizedBox(width: 36),
          const Spacer(),
          Column(
            children: [
              Text(weather.location.name!, style: AppStyle.styleBold22),
              Text(
                Helper.formatDateV2(weather.location.localtime),
                style: AppStyle.styleRegular14
                    .copyWith(color: const Color(0xff575757)),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color(0xff272727),
              size: 36,
            ),
          )
        ],
      ),
    );
  }
}
