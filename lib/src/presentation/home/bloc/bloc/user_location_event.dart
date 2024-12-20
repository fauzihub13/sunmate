part of 'user_location_bloc.dart';

@freezed
class UserLocationEvent with _$UserLocationEvent {
  const factory UserLocationEvent.started() = _Started;
  const factory UserLocationEvent.getLocation() = _GetLocation;
  const factory UserLocationEvent.getWeather() = _GetWeather;
}