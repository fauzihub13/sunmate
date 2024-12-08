part of 'vendor_booking_bloc.dart';

@freezed
class VendorBookingState with _$VendorBookingState {
  const factory VendorBookingState.initial() = _Initial;
  const factory VendorBookingState.loading() = _Loading;
  const factory VendorBookingState.success(VendorBookingModel vendorBooking) = _Success;
  const factory VendorBookingState.error(String message) = _Error;
}
