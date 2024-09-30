class LocationModel {
  final DateTime localtime;
  final String? coutry;
  final String? name;
  final double? longitude;
  final double? latitude;

  const LocationModel(
      {required this.localtime,
      this.coutry,
      this.name,
      this.longitude,
      this.latitude});

  factory LocationModel.fromJsonWeather(Map<String, dynamic> json) {
    return LocationModel(
        localtime: DateTime.parse(json['localtime']),
        longitude: json['lon'],
        latitude: json['lat']);
  }

  factory LocationModel.fromJsonCurrentLocation(Map<String, dynamic> json) {
    String nameHandle = json['features'][0]['properties']['district'] != null
        ? "${json['features'][0]['properties']['city']}, ${json['features'][0]['properties']['district']}"
        : "${json['features'][0]['properties']['city']}";
    return LocationModel(
      longitude: json['features'][0]['geometry']['coordinates'][0],
      latitude: json['features'][0]['geometry']['coordinates'][1],
      localtime: DateTime.now(),
      coutry: json['features'][0]['properties']['country'],
      name: nameHandle,
    );
  }

  factory LocationModel.fromJsonLocation(Map<String, dynamic> json) {
    return LocationModel(
        localtime: DateTime.now(),
        coutry: json['properties']['country'],
        name: json['properties']['name'],
        longitude: json['geometry']['coordinates'][0],
        latitude: json['geometry']['coordinates'][1]);
  }
}
