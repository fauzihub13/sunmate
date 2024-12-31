part of 'google_auth_bloc.dart';

@freezed
class GoogleAuthEvent with _$GoogleAuthEvent {
  const factory GoogleAuthEvent.started() = _Started;
  const factory GoogleAuthEvent.signIn() = _SignIn;
}