import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasources authRemoteDatasources;

  RegisterBloc(this.authRemoteDatasources) : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final result = await authRemoteDatasources.register(
          event.name, event.phoneNumber, event.email, event.password, event.passwordConfirmation);
      result.fold(
          (error) => emit(_Error(error)), (success) => emit(const _Success()));
    });
  }
}
