import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';

class CustomAppBarSearchView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewPadding,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<WeatherCubit>(context).getWeather();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 36,
              ),
            ),
            const Spacer(
              flex: 4,
            ),
            const Text(
              "Choose a city",
              style: AppStyle.styleBold22,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
