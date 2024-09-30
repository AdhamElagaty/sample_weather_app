import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/utils/helper.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_cubit.dart';
import 'package:sample_weather_app/views/search_view.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 52),
          Expanded(
            flex: 10,
            // Wrap Column with Expanded
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text to the left
              children: [
                // Limit the weather location name to 2 lines
                Text(
                  weather.location.name!,
                  style: AppStyle.styleBold22,
                  overflow: TextOverflow.ellipsis,
                ),
                // Format the date
                Text(
                  Helper.formatDateV2(weather.location.localtime),
                  style: AppStyle.styleRegular14
                      .copyWith(color: const Color(0xff575757)),
                  maxLines: 1, // Optional: limit the date to 1 line
                  overflow: TextOverflow.ellipsis, // Optional: handle overflow
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () async {
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
            icon: const Hero(
              tag: "SearchIcon",
              child: Icon(
                Icons.search,
                color: Color(0xff272727),
                size: 36,
              ),
            ),
          )
        ],
      ),
    );
  }
}
