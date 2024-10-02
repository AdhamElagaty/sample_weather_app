import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_state.dart';
import 'package:sample_weather_app/views/search_view.dart';
import 'package:sample_weather_app/views/widgets/custom_elevated_button_widget.dart';
import 'package:simple_shadow/simple_shadow.dart';

class LocationPermisionViewWidget extends StatelessWidget {
  const LocationPermisionViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff211772).withOpacity(0.95),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SimpleShadow(
                opacity: 0.45,
                offset: const Offset(6, 8),
                sigma: 10,
                child: SvgPicture.asset(
                  Assets.imagesLocationWeather,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return CustomElevatedButtonWidget(
                    onPressed: () async {
                      await getStateOnPressedButton(state, context);
                    },
                    backgroundColor: const Color(0xff00BFAE),
                    child: getStateWidgetButton(state),
                  );
                },
              ),
              const SizedBox(
                height: 22,
              ),
              CustomElevatedButtonWidget(
                onPressed: BlocProvider.of<WeatherCubit>(context).state
                        is NoLocationPermisionLoadingWeatherAndLocationDetails
                    ? () {
                        log(BlocProvider.of<WeatherCubit>(context)
                            .state
                            .toString());
                      }
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => LocationCubit(),
                              child: const SearchView(),
                            ),
                          ),
                        );
                      },
                backgroundColor: const Color(0xffFFD600),
                child: const Text(
                  "Search by Name 🔍",
                  style: AppStyle.styleMedium24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getStateWidgetButton(WeatherState state) {
    if (state is NoLocationPermisionOpend) {
      return const Text(
        "Enaple Location",
        style: AppStyle.styleMedium24,
      );
    } else if (state is NoLocationPermisionallowed) {
      return const Text(
        "Allow Access Location",
        style: AppStyle.styleMedium24,
      );
    } else {
      return const SpinKitFadingCube(
        color: Colors.white,
        size: 25.0,
      );
    }
  }

  Future<void> getStateOnPressedButton(
      WeatherState state, BuildContext context) async {
    if (state is NoLocationPermisionOpend) {
      await BlocProvider.of<WeatherCubit>(context).goToSettingToOpenLocation();
    } else if (state is NoLocationPermisionallowed) {
      await BlocProvider.of<WeatherCubit>(context)
          .goToSettingToChangePermission();
    } else {}
  }
}
