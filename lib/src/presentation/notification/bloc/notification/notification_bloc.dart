import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/notification/notification_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/notification/notification_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRemoteDatasources notificationRemoteDatasources;
  NotificationBloc(this.notificationRemoteDatasources)
      : super(const _Initial()) {
    on<_GetAllNotification>((event, emit) async {
       emit(const _Loading());
      final result =
          await notificationRemoteDatasources.getAllNotification();

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_Loaded(value.notifications ?? []));
      });
    });
  }
}
