part of 'vendor_booking_history_bloc.dart';

@freezed
class VendorBookingHistoryState with _$VendorBookingHistoryState {
  const factory VendorBookingHistoryState.initial() = _Initial;
  const factory VendorBookingHistoryState.loading() = _Loading;
  const factory VendorBookingHistoryState.loaded(List<BookingHistoryDataResponse> bookingHistoryDataResponse) = _Loaded;
  const factory VendorBookingHistoryState.error(String? message) = _Error;
}
