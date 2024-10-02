sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class NoLocationPermisionOpend extends WeatherState {}

final class NoLocationPermisionallowed extends WeatherState {}

final class NoLocationPermisionLoadingWeatherAndLocationDetails
    extends WeatherState {}

final class WeatherLoadingSuccsses extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoadingFailure extends WeatherState {
  final String errorMessage;

  WeatherLoadingFailure({required this.errorMessage});
}
