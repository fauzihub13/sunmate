part of 'vendor_detail_bloc.dart';

@freezed
class VendorDetailEvent with _$VendorDetailEvent {
  const factory VendorDetailEvent.started() = _Started;
  const factory VendorDetailEvent.addVendor(Vendor vendor) = _AddVendor;
}