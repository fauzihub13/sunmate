import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/sources/suncost/suncost_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/suncost/models/calculate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suncost_calculate_bloc.freezed.dart';
part 'suncost_calculate_event.dart';
part 'suncost_calculate_state.dart';

class SuncostCalculateBloc
    extends Bloc<SuncostCalculateEvent, SuncostCalculateState> {
  final SuncostLocalDatasources suncostLocalDatasources;
  SuncostCalculateBloc(this.suncostLocalDatasources) : super(const _Initial()) {
    on<_Calculate>((event, emit) async {
      emit(const _Loading());

      final result = await suncostLocalDatasources.calculate(
          event.placePurpose, event.monthlyBill, event.powerLevel);

      result.fold((error) {
        emit(_Error('Failed to estimate cost $error'));
      }, (result) {
        emit(_Loaded(result));
      });
    });
  }
}
