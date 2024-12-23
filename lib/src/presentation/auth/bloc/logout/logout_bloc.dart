import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasources authRemoteDatasources;
  LogoutBloc(this.authRemoteDatasources) : super(const _Initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasources.logout(event.token);
      result.fold(
          (error) => emit(_Error(error)), (success) => emit(const _Success()));
    });
  }
}
