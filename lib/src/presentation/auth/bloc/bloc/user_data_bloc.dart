import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';
part 'user_data_bloc.freezed.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final AuthRemoteDatasources authRemoteDatasources;

  UserDataBloc(this.authRemoteDatasources) : super(const _Initial()) {
    on<_GetUserData>((event, emit) async {
      emit(const _Loading());
      final result =
          await authRemoteDatasources.getUserData();
      result.fold(
          (error) => emit(_Error(error)), (value) => emit(_Loaded(value.user!)));
      
    });
  }
}
