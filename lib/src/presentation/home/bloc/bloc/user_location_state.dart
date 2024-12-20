part of 'user_location_bloc.dart';

@freezed
class UserLocationState with _$UserLocationState {
  const factory UserLocationState.initial() = _Initial;
  const factory UserLocationState.loading() = _Loading;
  const factory UserLocationState.locationLoaded(Position position) = _LocationLoaded;
  const factory UserLocationState.weatherLoaded(WeatherResponseModel weatherResponseModel) = _WeatherLoaded;
  const factory UserLocationState.error(String message) = _Error;
}
