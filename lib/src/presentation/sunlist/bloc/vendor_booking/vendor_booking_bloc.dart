import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_bloc.freezed.dart';
part 'vendor_booking_event.dart';
part 'vendor_booking_state.dart';

class VendorBookingBloc extends Bloc<VendorBookingEvent, VendorBookingState> {
  VendorBookingBloc() : super(const VendorBookingState.initial()) {
    on<_createBooking>((event, emit) async {
      emit(const _Loading());
      try {
        await BookingVendorLocalDatasources.instance
            .createBooking(event.vendorBooking);
        emit(_Success(event.vendorBooking));
      } catch (error) {
        emit(_Error("Gagal membuat jadwal: ${error.toString()}"));
      }

      // print('-----------------');
      // print('Data yang di-insert:');
      // print('ID Vendor: ${event.vendorBooking.idVendor}');
      // print('Nama Vendor: ${event.vendorBooking.vendorName}');
      // print('Tanggal Booking: ${event.vendorBooking.bookingDate}');
      // print('Tanggal Booking: ${event.vendorBooking.codeBooking}');

      emit(_Success(event.vendorBooking));
    });
  }
}
