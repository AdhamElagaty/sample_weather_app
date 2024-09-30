import 'package:sample_weather_app/models/services/weather_service/iweather_service.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';
import 'package:sample_weather_app/models/location_model.dart';

class WeatherController {
  final IWeatherService weatherService;

  WeatherController({required this.weatherService});

  Future<WeatherResponseModel> getWeather(LocationModel location) async {
    try {
      return await weatherService.getWeather(location);
    } catch (e) {
      throw Exception("Failed to retrieve weather data: ${e.toString()}");
    }
  }
}
