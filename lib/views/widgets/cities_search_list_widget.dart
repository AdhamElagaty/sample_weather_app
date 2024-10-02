import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_cubit.dart';
import 'package:sample_weather_app/views/widgets/city_widget.dart';

class CitiesSearchListWidget extends StatelessWidget {
  const CitiesSearchListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: context.read<LocationCubit>().locations!.map((location) {
        return CityWidget(
          location: location,
        );
      }).toList(),
    );
  }
}
