import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample_weather_app/utils/app_style.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_cubit.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_state.dart';
import 'package:sample_weather_app/views/widgets/cities_search_list_widget.dart';
import 'package:sample_weather_app/views/widgets/search_state_massege_widget.dart';

class SearchResultViewWidget extends StatelessWidget {
  const SearchResultViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cities",
          style:
              AppStyle.styleRegular18.copyWith(color: const Color(0xff211772)),
        ),
        const SizedBox(height: 16),
        BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return const Center(
                child: SpinKitFadingCube(
                  color: Color(0xff211772),
                  size: 34.0,
                ),
              );
            } else if (state is LocationNotExist) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchStateMassegeWidget(
                  stateMessage: "No Location With This Name😊",
                ),
              );
            } else if (state is LocationFailure) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchStateMassegeWidget(
                  stateMessage: state.errorMessage,
                ),
              );
            } else if (state is LocationSuccsses) {
              return const CitiesSearchListWidget();
            } else {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: SearchStateMassegeWidget(stateMessage: ""),
              );
            }
          },
        ),
      ],
    );
  }
}
