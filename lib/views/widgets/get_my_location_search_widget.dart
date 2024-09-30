import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:simple_shadow/simple_shadow.dart';

class GetMyLocationSearchWidget extends StatelessWidget {
  const GetMyLocationSearchWidget({
    super.key,
    required this.weatherCubit,
  });

  final WeatherCubit weatherCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Location",
          style:
              AppStyle.styleRegular18.copyWith(color: const Color(0xff211772)),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            weatherCubit.getWeatherByDeviceLocation();
            Navigator.pop(context);
          },
          child: Container(
            height: 78,
            decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 12),
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.green[400],
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Get Weather",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SimpleShadow(
                    opacity: 0.45,
                    offset: const Offset(6, 8),
                    sigma: 10,
                    child: SvgPicture.asset(
                      Assets.imagesRainyLightningWindySunnyLogo,
                      height: 62,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
