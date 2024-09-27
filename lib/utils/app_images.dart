class Assets {
  Assets._();

  // Generated Assets by Flutter Assets Gen Packge.

  /// Assets for imagesClear
  /// assets/images/clear.svg
  static const String imagesClear = "assets/images/clear.svg";

  /// Assets for imagesCloudy
  /// assets/images/cloudy.svg
  static const String imagesCloudy = "assets/images/cloudy.svg";

  /// Assets for imagesCloudySunny
  /// assets/images/cloudy_sunny.svg
  static const String imagesCloudySunny = "assets/images/cloudy_sunny.svg";

  /// Assets for imagesMostlySunny
  /// assets/images/mostly_sunny.svg
  static const String imagesMostlySunny = "assets/images/mostly_sunny.svg";

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

  static const Map<String, String> _weatherStatusMap = {
    "Sunny": imagesSunny,
    "Clear": imagesClear,
    "Partly Cloudy": imagesCloudySunny,
    "Cloudy": imagesCloudy,
    "Overcast": imagesCloudy, // Reusing cloudy for overcast
    "Mist": imagesCloudySunny, // Assuming similar representation
    "Patchy rain nearby": imagesRainyLightningWindySunnyLogo,
    "Patchy snow nearby":
        imagesSnow, // Assuming snow image for snowy conditions
    "Patchy sleet nearby":
        imagesRainyLightningWindySunnyLogo, // Assuming rain representation for sleet
    "Patchy freezing drizzle nearby": imagesRainyLightningWindySunnyLogo,
    "Thundery outbreaks in nearby": imagesShowerWindyLightningMoon,
    "Blowing snow": imagesSnow,
    "Blizzard": imagesSnow,
    "Fog": imagesCloudySunny,
    "Freezing fog": imagesCloudy,
    "Patchy light drizzle": imagesRainyLightningWindySunnyLogo,
    "Light drizzle": imagesRainyLightningWindySunnyLogo,
    "Freezing drizzle": imagesRainyLightningWindySunnyLogo,
    "Heavy freezing drizzle": imagesRainyLightningWindySunnyLogo,
    "Patchy light rain": imagesRainyLightningWindySunnyLogo,
    "Light rain": imagesRainyLightningWindySunnyLogo,
    "Moderate rain at times": imagesRainyLightningWindySunnyLogo,
    "Moderate rain": imagesRainyLightningWindySunnyLogo,
    "Heavy rain at times": imagesRainyLightningWindySunnyLogo,
    "Heavy rain": imagesRainyLightningWindySunnyLogo,
    "Light freezing rain": imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy freezing rain": imagesRainyLightningWindySunnyLogo,
    "Light sleet": imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy sleet": imagesRainyLightningWindySunnyLogo,
    "Patchy light snow": imagesSnow,
    "Light snow": imagesSnow,
    "Patchy moderate snow": imagesSnow,
    "Moderate snow": imagesSnow,
    "Patchy heavy snow": imagesSnow,
    "Heavy snow": imagesSnow,
    "Ice pellets": imagesSnow,
    "Light rain shower": imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy rain shower": imagesRainyLightningWindySunnyLogo,
    "Torrential rain shower": imagesRainyLightningWindySunnyLogo,
    "Light sleet showers": imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy sleet showers": imagesRainyLightningWindySunnyLogo,
    "Light snow showers": imagesSnow,
    "Moderate or heavy snow showers": imagesSnow,
    "Light showers of ice pellets": imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy showers of ice pellets":
        imagesRainyLightningWindySunnyLogo,
    "Patchy light rain in area with thunder":
        imagesRainyLightningWindySunnyLogo,
    "Moderate or heavy rain in area with thunder":
        imagesRainyLightningWindySunnyLogo,
    "Patchy light snow in area with thunder":
        imagesShowerWindyLightningMoon, // Thunder and snow combined
    "Moderate or heavy snow in area with thunder":
        imagesShowerWindyLightningMoon,
  };

  static String getWeatherImage(String status) {
    return _weatherStatusMap[status] ?? imagesCloudy;
  }
}
