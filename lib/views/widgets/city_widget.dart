import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:simple_shadow/simple_shadow.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
    required this.location,
  });

  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<WeatherCubit>().location = location;
        context.read<WeatherCubit>().getWeather();
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.red[400],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "${location.coutry}, ${location.name}",
                        style: AppStyle.styleMedium16.copyWith(fontSize: 20),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SimpleShadow(
                  opacity: 0.45,
                  offset: const Offset(6, 8),
                  sigma: 10,
                  child: SvgPicture.asset(
                    Assets.imagesEarthWeather,
                    height: 42,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
