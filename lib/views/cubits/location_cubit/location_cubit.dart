import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_weather_app/controllers/location_controller.dart';
import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/services/location_service/location_service.dart';
import 'package:sample_weather_app/views/cubits/location_cubit/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  final TextEditingController searchController = TextEditingController();
  final _locationService = LocationService(dio: Dio());
  List<LocationModel>? locations;
  Timer? _debounce;

  Future<void> getAutoSearchLocation({LocationModel? deviceLocation}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult[0] == ConnectivityResult.none) {
      emit(LocationFailure(errorMessage: "No Internet Connection 😊"));

      Connectivity().onConnectivityChanged.listen((result) async {
        if (result[0] != ConnectivityResult.none) {
          getAutoSearchLocation(deviceLocation: deviceLocation);
        }
      });
      return;
    }
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 800), () async {
      emit(LocationLoading());
      try {
        if (searchController.text.trim().isEmpty) {
          emit(LocationInitial());
        }
        String searchInput = searchController.text;
        locations = await LocationController(locationService: _locationService)
            .getLocations(searchInput, nearLocation: deviceLocation);
        if (locations!.isNotEmpty) {
          emit(LocationSuccsses());
        } else {
          emit(LocationNotExist());
        }
      } catch (e) {
        emit(LocationFailure(
          errorMessage: "Error on Location Search! Try Later😊",
        ));
      }
    });
  }
}
