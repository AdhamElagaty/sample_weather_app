import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/services/location_service/ilocation_service.dart';

class LocationService implements ILocationService {
  final Dio dio;
  final String baseURL = "https://photon.komoot.io";

  LocationService({required this.dio});

  @override
  Future<LocationModel> getLocationByMapPosition(
      {required String lon, required String lat}) async {
    try {
      var response =
          await dio.get("$baseURL/reverse?lat=$lat&lon=$lon&lang=en");
      LocationModel location =
          LocationModel.fromJsonCurrentLocation(response.data);
      return location;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]["message"] ??
          "oops there was an error, try later!";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try later!");
    }
  }

  @override
  Future<List<LocationModel>> geLocationsBySearch(
      {required String search, LocationModel? nearLocation}) async {
    try {
      String nearPosition = nearLocation == null
          ? ""
          : "&lat=${nearLocation.latitude}&lon=${nearLocation.longitude}";
      var response = await dio
          .get("$baseURL/api/?q=$search&limit=15&lang=en$nearPosition");
      List<LocationModel> locations = [];
      for (var location in response.data['features']) {
        locations.add(LocationModel.fromJsonLocation(location));
      }
      return locations;
    } on DioException catch (e) {
      final String errMessage = e.response?.data["error"]["message"] ??
          "oops there was an error, try later!";
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error, try later!");
    }
  }
}
