part of 'vendor_booking_bloc.dart';

@freezed
class VendorBookingEvent with _$VendorBookingEvent {
  const factory VendorBookingEvent.started() = _Started;
  const factory VendorBookingEvent.createBooking(VendorBookingModel vendorBooking) = _createBooking;
}