import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_history_bloc.freezed.dart';
part 'vendor_booking_history_event.dart';
part 'vendor_booking_history_state.dart';

class VendorBookingHistoryBloc
    extends Bloc<VendorBookingHistoryEvent, VendorBookingHistoryState> {
  final BookingVendorLocalDatasources bookingVendorLocalDatasources;
  VendorBookingHistoryBloc(this.bookingVendorLocalDatasources)
      : super(const _Initial()) {
    on<_GetAllBookingHistory>((event, emit) async {
      emit(const _Loading());
      final result = await bookingVendorLocalDatasources.getAllBookingData();

      emit(_Loaded(result));
    });
  }
}
