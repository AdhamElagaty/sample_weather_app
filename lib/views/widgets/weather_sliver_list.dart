import 'package:flutter/material.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/views/widgets/weather_extra_information_widget.dart';

class WeatherSliverList extends StatelessWidget {
  const WeatherSliverList({
    super.key,
    required this.weather,
  });

  final WeatherResponseModel weather;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff211772).withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(42),
                topRight: Radius.circular(42),
              ),
            ),
            child: WeatherExtraInformationWidget(weather: weather),
          ),
        ],
      ),
    );
  }
}
