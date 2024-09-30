import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_weather_app/utils/app_images.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_cubit.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_state.dart';
import 'package:sample_weather_app/views/home_view.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await BlocProvider.of<WeatherCubit>(context).getWeatherByDeviceLocation();
    // ignore: use_build_context_synchronously
    var cubit = BlocProvider.of<WeatherCubit>(context);
    if (cubit.state is WeatherLoadingFailure ||
        cubit.state is NoLocationPermisionOpend ||
        cubit.state is NoLocationPermisionallowed) {
      await Future.delayed(const Duration(seconds: 2));
    }

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeView(),
        transitionDuration: const Duration(milliseconds: 1500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff211772).withOpacity(0.95),
      body: Center(
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
              height: 32,
            ),
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                return state
                        is NoLocationPermisionLoadingWeatherAndLocationDetails
                    ? const SpinKitFadingCube(
                        color: Colors.white,
                        size: 25.0,
                      )
                    : const SizedBox(height: 25);
              },
            ),
          ],
        ),
      ),
    );
  }
}
