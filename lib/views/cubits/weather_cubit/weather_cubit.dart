import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_weather_app/controllers/location_controller.dart';
import 'package:sample_weather_app/controllers/weather_controller.dart';
import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/services/location_service/location_service.dart';
import 'package:sample_weather_app/models/services/weather_service/weather_service.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/views/cubits/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final _locationService = LocationService(dio: Dio());
  final _weatherService = WeatherService(dio: Dio());
  LocationPermission? permission;
  LocationModel? location;
  LocationModel? deviceLocation;
  WeatherResponseModel? weatherResponse;

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(NoLocationPermisionOpend());
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(NoLocationPermisionallowed());
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(NoLocationPermisionallowed());
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  bool checkPositin() {
    return location == null;
  }

  Future<void> getWeatherByDeviceLocation() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      emit(WeatherLoadingFailure(errorMessage: "No Internet Connection 😊"));

      Connectivity().onConnectivityChanged.listen((result) async {
        if (result[0] != ConnectivityResult.none) {
          getWeatherByDeviceLocation();
        }
      });
      return;
    }

    Position? position = await _determinePosition();
    if (position != null) {
      if (state is WeatherLoadingFailure) {
        emit(WeatherLoading());
      } else {
        emit(NoLocationPermisionLoadingWeatherAndLocationDetails());
      }
      try {
        var futureData = await Future.wait([
          LocationController(locationService: _locationService).getLocation(
            position.longitude.toString(),
            position.latitude.toString(),
          ),
          WeatherController(weatherService: _weatherService).getWeather(
            LocationModel(
              localtime: DateTime.now(),
              longitude: position.longitude,
              latitude: position.latitude,
            ),
          ),
        ]);
        location = futureData[0] as LocationModel;
        deviceLocation = futureData[0] as LocationModel;
        WeatherResponseModel weatherResponseModel = WeatherResponseModel(
            location: (futureData[0] as LocationModel),
            current: (futureData[1] as WeatherResponseModel).current,
            forecast: (futureData[1] as WeatherResponseModel).forecast);
        weatherResponse = weatherResponseModel;
        emit(WeatherLoadingSuccsses());
      } catch (e) {
        emit(WeatherLoadingFailure(
            errorMessage: "Loading Message Error!\n Try Later😊"));
      }
    }
  }

  Future<void> getWeather() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      emit(WeatherLoadingFailure(errorMessage: "No Internet Connection 😊"));

      Connectivity().onConnectivityChanged.listen((result) async {
        if (result[0] != ConnectivityResult.none) {
          getWeather();
        }
      });
      return;
    }

    if (location != null) {
      if (state is! WeatherLoadingSuccsses) {
        emit(WeatherLoading());
      }
      try {
        WeatherResponseModel model =
            await WeatherController(weatherService: _weatherService).getWeather(
          LocationModel(
            localtime: DateTime.now(),
            longitude: location!.longitude,
            latitude: location!.latitude,
          ),
        );
        weatherResponse = WeatherResponseModel(
            location: location!,
            current: model.current,
            forecast: model.forecast);
        emit(WeatherLoadingSuccsses());
      } catch (e) {
        emit(WeatherLoadingFailure(
            errorMessage: "Loading Message Error!\n Try Later😊"));
      }
    }
  }

  Future<void> goToSettingToChangePermission() async {
    final completer = Completer<void>();
    WidgetsBinding.instance.addObserver(LifecycleObserver(completer));
    await Geolocator.openAppSettings();
    await completer.future;
    await getWeatherByDeviceLocation();
    WidgetsBinding.instance.removeObserver(LifecycleObserver(completer));
  }

  Future<void> goToSettingToOpenLocation() async {
    final completer = Completer<void>();
    WidgetsBinding.instance.addObserver(LifecycleObserver(completer));
    await Geolocator.openLocationSettings();
    await Future.delayed(const Duration(milliseconds: 1500));
    await completer.future;
    await getWeatherByDeviceLocation();
    WidgetsBinding.instance.removeObserver(LifecycleObserver(completer));
  }
}

class LifecycleObserver extends WidgetsBindingObserver {
  final Completer<void> completer;

  LifecycleObserver(this.completer);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      completer.complete();
      WidgetsBinding.instance.removeObserver(this);
    }
  }
}
