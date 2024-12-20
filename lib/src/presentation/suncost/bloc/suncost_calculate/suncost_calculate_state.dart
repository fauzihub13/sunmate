part of 'suncost_calculate_bloc.dart';

@freezed
class SuncostCalculateState with _$SuncostCalculateState {
  const factory SuncostCalculateState.initial() = _Initial;
  const factory SuncostCalculateState.loading() = _Loading;
  const factory SuncostCalculateState.loaded(CalculateModel calculateModel) = _Loaded;
  const factory SuncostCalculateState.error(String message) = _Error;
}
