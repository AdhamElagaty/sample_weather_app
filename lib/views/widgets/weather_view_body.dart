import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_state.dart';
import 'package:sample_weather_app/views/widgets/custom_sliver_app_bar.dart';
import 'package:sample_weather_app/views/widgets/weather_sliver_list.dart';

class WeatherViewBody extends StatelessWidget {
  const WeatherViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        WeatherResponseModel weather =
            BlocProvider.of<WeatherCubit>(context).weatherResponse!;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                BlocProvider.of<WeatherCubit>(context)
                    .weatherResponse!
                    .current
                    .condition
                    .color[300]!,
                BlocProvider.of<WeatherCubit>(context)
                    .weatherResponse!
                    .current
                    .condition
                    .color[200]!,
                BlocProvider.of<WeatherCubit>(context)
                    .weatherResponse!
                    .current
                    .condition
                    .color[50]!,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: LiquidPullToRefresh(
            animSpeedFactor: 2,
            height: 180,
            color: const Color(0xff211772).withOpacity(0.9),
            onRefresh: () async {
              await BlocProvider.of<WeatherCubit>(context).getWeather();
            },
            backgroundColor: const Color.fromARGB(96, 144, 145, 198),
            showChildOpacityTransition: true,
            child: CustomScrollView(
              slivers: [
                CustomSliverAppBar(weather: weather),
                WeatherSliverList(weather: weather),
              ],
            ),
          ),
        );
      },
    );
  }
}
