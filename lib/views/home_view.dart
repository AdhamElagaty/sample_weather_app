import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_state.dart';
import 'package:sample_weather_app/views/widgets/error_view_body.dart';
import 'package:sample_weather_app/views/widgets/loading_view_body.dart';
import 'package:sample_weather_app/views/widgets/location_permision_view.dart';
import 'package:sample_weather_app/views/widgets/weather_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: getHomeView(state),
          ),
        );
      },
    );
  }

  StatelessWidget getHomeView(WeatherState state) {
    if (state is NoLocationPermisionOpend ||
        state is NoLocationPermisionallowed ||
        state is NoLocationPermisionLoadingWeatherAndLocationDetails) {
      return const LocationPermisionViewWidget();
    } else if (state is WeatherLoading) {
      return const LoadingViewBody();
    } else if (state is WeatherLoadingSuccsses) {
      return const WeatherViewBody();
    } else {
      return ErrorViewBody(
          errorMessage: (state as WeatherLoadingFailure).errorMessage);
    }
  }
}
