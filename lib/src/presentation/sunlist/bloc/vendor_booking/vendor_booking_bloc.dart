import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/vendor/booking_vendor_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_bloc.freezed.dart';
part 'vendor_booking_event.dart';
part 'vendor_booking_state.dart';

class VendorBookingBloc extends Bloc<VendorBookingEvent, VendorBookingState> {
  final BookingVendorRemoteDatasources bookingVendorRemoteDatasources;

  VendorBookingBloc(this.bookingVendorRemoteDatasources)
      : super(const VendorBookingState.initial()) {
    on<_createBooking>((event, emit) async {
      emit(const _Loading());
      final result = await bookingVendorRemoteDatasources
          .createBooking(event.vendorBooking);
      result.fold((error) => emit(_Error(error)), (success) {
        return emit(_Success(success));
      });
    });
  }
}
