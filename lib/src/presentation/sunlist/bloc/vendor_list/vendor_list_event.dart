part of 'vendor_list_bloc.dart';

@freezed
class VendorListEvent with _$VendorListEvent {
  const factory VendorListEvent.started() = _Started;
  const factory VendorListEvent.getAllVendor() = _GetAllVendor;
}