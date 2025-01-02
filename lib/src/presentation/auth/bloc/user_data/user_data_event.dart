part of 'user_data_bloc.dart';

@freezed
class UserDataEvent with _$UserDataEvent {
  const factory UserDataEvent.started() = _Started;
  const factory UserDataEvent.getUserData() = _GetUserData;
  const factory UserDataEvent.updateUserData({required String name, required String phoneNumber, required String email}) = _UpdateUserData;
  const factory UserDataEvent.updateUserPassword({required String oldPassword, required String password, required String passwordConfirmation}) = _UpdateUserPassword;
  const factory UserDataEvent.updateUserProfilePhoto({required Uint8List bytes}) = _UpdateUserProfilePhoto;
}