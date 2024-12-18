import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasources authRemoteDatasources;

  LoginBloc(
    this.authRemoteDatasources,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result =
          await authRemoteDatasources.login(event.email, event.password);
      result.fold(
          (error) => emit(_Error(error)), (success) => emit(_Success(success)));
    });
  }
}
