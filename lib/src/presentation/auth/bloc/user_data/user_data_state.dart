part of 'user_data_bloc.dart';

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState.initial() = _Initial;
  const factory UserDataState.loading() = _Loading;
  const factory UserDataState.loaded(User user) = _Loaded;
  const factory UserDataState.error(String meesage) = _Error;
}
