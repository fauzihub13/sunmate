import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_detail_event.dart';
part 'vendor_detail_state.dart';
part 'vendor_detail_bloc.freezed.dart';

class VendorDetailBloc extends Bloc<VendorDetailEvent, VendorDetailState> {
  VendorDetailBloc() : super(const VendorDetailState.initial()) {
    

    on<_AddVendor>((event, emit) {
       emit(VendorDetailState.loaded(event.vendor));
    });
    
  }
}
