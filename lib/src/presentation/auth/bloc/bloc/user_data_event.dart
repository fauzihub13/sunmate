part of 'user_data_bloc.dart';

@freezed
class UserDataEvent with _$UserDataEvent {
  const factory UserDataEvent.started() = _Started;
  const factory UserDataEvent.getUserData() = _GetUserData;
}