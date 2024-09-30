import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/weather_response_model.dart';

abstract class IWeatherService {
  Future<WeatherResponseModel> getWeather(LocationModel location);
}
