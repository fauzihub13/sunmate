part of 'vendor_booking_history_bloc.dart';

@freezed
class VendorBookingHistoryEvent with _$VendorBookingHistoryEvent {
  const factory VendorBookingHistoryEvent.started() = _Started;
  const factory VendorBookingHistoryEvent.getAllBookingHistory() = _GetAllBookingHistory;
}