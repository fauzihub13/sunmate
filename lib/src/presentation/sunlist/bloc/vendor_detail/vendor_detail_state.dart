part of 'vendor_detail_bloc.dart';

@freezed
class VendorDetailState with _$VendorDetailState {
  const factory VendorDetailState.initial() = _Initial;
  const factory VendorDetailState.loading() = _Loading;
  const factory VendorDetailState.loaded(SingleVendor vendor) = _Loaded;
  const factory VendorDetailState.error(String message) = _Error;
}
