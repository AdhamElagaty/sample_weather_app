import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/services/weather_service/iweather_service.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';

class WeatherService implements IWeatherService {
  final Dio dio;
  final String baseURL = "http://api.weatherapi.com/v1";
  final String apiKey = "0ba1e813d68e48789fd110105232410";

  WeatherService({required this.dio});

  @override
  Future<WeatherResponseModel> getWeather(LocationModel location) async {
    try {
      var response = await dio.get(
          "$baseURL/forecast.json?key=$apiKey&q=${location.latitude},${location.longitude}&days=7");
      WeatherResponseModel weather =
          WeatherResponseModel.fromJson(response.data, location);
      return weather;
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
