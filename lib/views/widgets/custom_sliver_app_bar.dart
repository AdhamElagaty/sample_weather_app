import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/views/widgets/current_weather_information_widget.dart';
import 'package:sample_weather_app/views/widgets/weather_view_header_widget.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.weather,
  });

  final WeatherResponseModel weather;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.65,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: MediaQuery.of(context).viewPadding,
          child: Column(
            children: [
              WeatherViewHeaderWidget(weather: weather),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Hero(
                    tag: "HeroAnimation",
                    child: SimpleShadow(
                      opacity: 0.45,
                      offset: const Offset(6, 8),
                      sigma: 10,
                      child: SvgPicture.asset(
                        weather.current.condition.imagePath,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              CurrentWeatherInformationWidget(weather: weather),
            ],
          ),
        ),
      ),
    );
  }
}
