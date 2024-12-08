import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_event.dart';
part 'vendor_booking_state.dart';
part 'vendor_booking_bloc.freezed.dart';

class VendorBookingBloc extends Bloc<VendorBookingEvent, VendorBookingState> {
  VendorBookingBloc() : super(const VendorBookingState.initial()) {
    on<_createBooking>((event, emit) async {
      emit(const _Loading());
      await BookingVendorLocalDatasources.instance.createBooking(event.vendorBooking);
      emit(_Success(event.vendorBooking));
    });
  }
}
