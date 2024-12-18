import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/vendor_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_list_bloc.freezed.dart';
part 'vendor_list_event.dart';
part 'vendor_list_state.dart';

class VendorListBloc extends Bloc<VendorListEvent, VendorListState> {
  final VendorRemoteDatasources vendorRemoteDatasources;
  VendorListBloc(this.vendorRemoteDatasources) : super(const _Initial()) {
    on<_GetAllVendor>((event, emit) async {
      emit(const _Loading());

      final result = await vendorRemoteDatasources.getVendors();
      

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_Loaded(value.data ?? []));
      });
    });
  }
}
