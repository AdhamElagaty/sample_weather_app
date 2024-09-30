import 'package:sample_weather_app/models/location_model.dart';

abstract class ILocationService {
  Future<LocationModel> getLocationByMapPosition({
    required String lon,
    required String lat,
  });
}
