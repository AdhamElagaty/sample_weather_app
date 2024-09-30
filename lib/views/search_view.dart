import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:sample_weather_app/views/widgets/custom_app_bar_search_view.dart';
import 'package:sample_weather_app/views/widgets/custom_text_form_field_widget.dart';
import 'package:sample_weather_app/views/widgets/get_my_location_search_widget.dart';
import 'package:sample_weather_app/views/widgets/search_result_view_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();
    final locationCubit = context.read<LocationCubit>();

    final List<Color> colors = weatherCubit.weatherResponse == null
        ? [Colors.grey, Colors.grey[200]!, Colors.grey[50]!]
        : [
            weatherCubit.weatherResponse!.current.condition.color[300]!,
            weatherCubit.weatherResponse!.current.condition.color[200]!,
            weatherCubit.weatherResponse!.current.condition.color[50]!,
          ];

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarSearchView(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormFieldWidget(
                        hintText: "Search a new city...",
                        labelText: "Search",
                        controller: locationCubit.searchController,
                        onChanged: (value) {
                          locationCubit.getAutoSearchLocation(
                              deviceLocation: weatherCubit.deviceLocation);
                        },
                      ),
                      const SizedBox(height: 16),
                      GetMyLocationSearchWidget(weatherCubit: weatherCubit),
                      const SizedBox(height: 16),
                      const SearchResultViewWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
