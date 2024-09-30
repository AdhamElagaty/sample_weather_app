import 'package:sample_weather_app/models/location_model.dart';
import 'package:sample_weather_app/models/services/location_service/ilocation_service.dart';

class LocationController {
  final ILocationService locationService;

  LocationController({required this.locationService});

  Future<LocationModel> getLocation(String lon, String lat) async {
    try {
      return await locationService.getLocationByMapPosition(lon: lon, lat: lat);
    } catch (e) {
      throw Exception("Failed to retrieve location: ${e.toString()}");
    }
  }
}
