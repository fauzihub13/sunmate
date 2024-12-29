part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState.initial() = _Initial;
  const factory UserDataState.loading() = _Loading;
  const factory UserDataState.successGetUserData(User user) = _SuccessGetUserData;
  const factory UserDataState.successUpdateUserData(User user) = _SuccessUpdateUserData;
  const factory UserDataState.successUpdateUserPassword() = _SuccessUpdateUserPassword;
  const factory UserDataState.error(String message) = _Error;
}
