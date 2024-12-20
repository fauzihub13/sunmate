import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/presentation/suncost/models/calculate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suncost_calculate_event.dart';
part 'suncost_calculate_state.dart';
part 'suncost_calculate_bloc.freezed.dart';

class SuncostCalculateBloc extends Bloc<SuncostCalculateEvent, SuncostCalculateState> {
  SuncostCalculateBloc() : super(_Initial()) {
    on<SuncostCalculateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
