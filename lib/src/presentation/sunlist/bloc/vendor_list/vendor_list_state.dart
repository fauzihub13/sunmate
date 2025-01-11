part of 'vendor_list_bloc.dart';

@freezed
class VendorListState with _$VendorListState {
  const factory VendorListState.initial() = _Initial;
  const factory VendorListState.loading() = _Loading;
  const factory VendorListState.loaded(List<SingleVendor> vendor)= _Loaded;
  const factory VendorListState.detailVendorLoaded(SingleVendor vendor)= _DetailVendorLoaded;
  const factory VendorListState.error(String message) = _Error;
}
