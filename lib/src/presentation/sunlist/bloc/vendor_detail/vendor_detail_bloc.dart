import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_detail_bloc.freezed.dart';
part 'vendor_detail_event.dart';
part 'vendor_detail_state.dart';

class VendorDetailBloc extends Bloc<VendorDetailEvent, VendorDetailState> {
  VendorDetailBloc() : super(const VendorDetailState.initial()) {
    on<_AddVendor>((event, emit) {
      emit(VendorDetailState.loaded(event.vendor));
    });
  }
}
