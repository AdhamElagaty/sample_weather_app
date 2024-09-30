import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ErrorViewBody extends StatelessWidget {
  const ErrorViewBody({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff211772).withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleShadow(
                opacity: 0.45,
                offset: const Offset(6, 8),
                sigma: 10,
                child: SvgPicture.asset(
                  Assets.imagesRainyLightningWindySunnyLogo,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                errorMessage,
                style: AppStyle.styleBold22
                    .copyWith(color: const Color.fromARGB(177, 255, 213, 0)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
