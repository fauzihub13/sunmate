import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/google_auth_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_auth_bloc.freezed.dart';
part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final GoogleAuthService googleAuthService;
  GoogleAuthBloc(this.googleAuthService) : super(const _Initial()) {
    on<_SignIn>((event, emit) async {
      emit(const _Loading());
      final result = await googleAuthService.loginWithGoogle();
      result.fold((error) => emit(_Error(error)), (success) {
        emit(_Success(success));
      });
    });
  }
}
