import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SearchStateMassegeWidget extends StatelessWidget {
  const SearchStateMassegeWidget({
    super.key,
    required this.stateMessage,
  });

  final String stateMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
          width: double.infinity,
        ),
        Hero(
          tag: "HeroAnimation",
          child: SimpleShadow(
            opacity: 0.45,
            offset: const Offset(6, 8),
            sigma: 10,
            child: SvgPicture.asset(
              Assets.imagesEarthWeather,
              height: 200,
            ),
          ),
        ),
        Text(
          stateMessage,
          style: AppStyle.styleBold22
              .copyWith(color: const Color.fromARGB(176, 58, 57, 51)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
