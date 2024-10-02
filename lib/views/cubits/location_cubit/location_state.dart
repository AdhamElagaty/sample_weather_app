sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationNotExist extends LocationState {}

final class LocationSuccsses extends LocationState {}

final class LocationFailure extends LocationState {
  final String errorMessage;

  LocationFailure({required this.errorMessage});
}
