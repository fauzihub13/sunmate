import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_history_model.dart';
import 'package:flutter_sunmate/src/data/sources/vendor/booking_vendor_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_history_bloc.freezed.dart';
part 'vendor_booking_history_event.dart';
part 'vendor_booking_history_state.dart';

class VendorBookingHistoryBloc
    extends Bloc<VendorBookingHistoryEvent, VendorBookingHistoryState> {
  final BookingVendorRemoteDatasources bookingVendorRemoteDatasources;
  VendorBookingHistoryBloc(this.bookingVendorRemoteDatasources)
      : super(const _Initial()) {
    on<_GetAllBookingHistory>((event, emit) async {
      emit(const _Loading());
      final result =
          await bookingVendorRemoteDatasources.getUserBookingHistory();

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_Loaded(value.data ?? []));
      });
    });

    on<_GetVendorBookingHistory>((event, emit) async {
      emit(const _Loading());
      final result =
          await bookingVendorRemoteDatasources.getVendorBookingHistory();

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_Loaded(value.data ?? []));
      });
    });

    on<_UpdateBookingHistoryStatus>((event, emit) async {
      emit(const _Loading());
      final result = await bookingVendorRemoteDatasources
          .updateBookingHistoryStatus(event.vendorId, event.bookingStatus);

      result.fold((error) => emit(_Error(error)), (value) {
        emit(const _SuccessUpdateBookingStatus());
      });
    });
  }
}
