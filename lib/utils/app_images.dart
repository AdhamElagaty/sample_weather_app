// ignore_for_file: prefer_single_quotes
class Assets {
  Assets._();

  /// Assets for imagesClear
  /// assets/images/clear.svg
  static const String imagesClear = "assets/images/clear.svg";

  /// Assets for imagesClouds
  /// assets/images/clouds.svg
  static const String imagesClouds = "assets/images/clouds.svg";

  /// Assets for imagesCloudy
  /// assets/images/cloudy.svg
  static const String imagesCloudy = "assets/images/cloudy.svg";

  /// Assets for imagesCloudySunny
  /// assets/images/cloudy_sunny.svg
  static const String imagesCloudySunny = "assets/images/cloudy_sunny.svg";

  /// Assets for imagesMostlySunny
  /// assets/images/mostly_sunny.svg
  static const String imagesMostlySunny = "assets/images/mostly_sunny.svg";

  /// Assets for imagesRainy
  /// assets/images/rainy.svg
  static const String imagesRainy = "assets/images/rainy.svg";

  /// Assets for imagesRainyLightning
  /// assets/images/rainy_lightning.svg
  static const String imagesRainyLightning =
      "assets/images/rainy_lightning.svg";

  /// Assets for imagesRainyLightningWindySunnyLogo
  /// assets/images/rainy_lightning_windy_sunny_logo.svg
  static const String imagesRainyLightningWindySunnyLogo =
      "assets/images/rainy_lightning_windy_sunny_logo.svg";

  /// Assets for imagesShowerWindyLightningMoon
  /// assets/images/shower_windy_lightning_moon.svg
  static const String imagesShowerWindyLightningMoon =
      "assets/images/shower_windy_lightning_moon.svg";

  /// Assets for imagesSnow
  /// assets/images/snow.svg
  static const String imagesSnow = "assets/images/snow.svg";

  /// Assets for imagesSunny
  /// assets/images/sunny.svg
  static const String imagesSunny = "assets/images/sunny.svg";

  /// Assets for LocationWeather
  /// assets/images/location_weather.svg
  static const String imagesLocationWeather =
      "assets/images/location_weather.svg";

  /// Assets for EarthWeather
  /// assets/images/earth_weather.svg
  static const String imagesEarthWeather = "assets/images/earth_weather.svg";

  static const Map<String, String> _weatherStatusMap = {
    "Sunny": imagesSunny,
    "Clear": imagesClear,
    "Partly Cloudy": imagesCloudySunny,
    "Cloudy": imagesCloudy,
    "Overcast": imagesCloudy,
    "Mist": imagesCloudySunny,
    "Patchy rain nearby": imagesRainyLightningWindySunnyLogo,
    "Patchy snow nearby": imagesSnow,
    "Patchy sleet nearby": imagesRainy,
    "Patchy freezing drizzle nearby": imagesRainy,
    "Thundery outbreaks in nearby": imagesShowerWindyLightningMoon,
    "Blowing snow": imagesSnow,
    "Blizzard": imagesSnow,
    "Fog": imagesCloudySunny,
    "Freezing fog": imagesCloudy,
    "Patchy light drizzle": imagesRainy,
    "Light drizzle": imagesRainy,
    "Freezing drizzle": imagesRainy,
    "Heavy freezing drizzle": imagesRainy,
    "Patchy light rain": imagesRainy,
    "Light rain": imagesRainy,
    "Moderate rain at times": imagesRainy,
    "Moderate rain": imagesRainy,
    "Heavy rain at times": imagesRainy,
    "Heavy rain": imagesRainy,
    "Light freezing rain": imagesRainy,
    "Moderate or heavy freezing rain": imagesRainy,
    "Light sleet": imagesRainy,
    "Moderate or heavy sleet": imagesRainy,
    "Patchy light snow": imagesSnow,
    "Light snow": imagesSnow,
    "Patchy moderate snow": imagesSnow,
    "Moderate snow": imagesSnow,
    "Patchy heavy snow": imagesSnow,
    "Heavy snow": imagesSnow,
    "Ice pellets": imagesSnow,
    "Light rain shower": imagesRainy,
    "Moderate or heavy rain shower": imagesRainy,
    "Torrential rain shower": imagesRainy,
    "Light sleet showers": imagesRainy,
    "Moderate or heavy sleet showers": imagesRainy,
    "Light snow showers": imagesSnow,
    "Moderate or heavy snow showers": imagesSnow,
    "Light showers of ice pellets": imagesRainy,
    "Moderate or heavy showers of ice pellets": imagesRainy,
    "Patchy light rain in area with thunder": imagesRainyLightning,
    "Moderate or heavy rain in area with thunder": imagesRainyLightning,
    "Patchy light snow in area with thunder": imagesShowerWindyLightningMoon,
    "Moderate or heavy snow in area with thunder":
        imagesShowerWindyLightningMoon,
  };

  static String getWeatherImage(String status) {
    return _weatherStatusMap[status] ?? imagesCloudy;
  }
}
