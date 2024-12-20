part of 'suncost_calculate_bloc.dart';

@freezed
class SuncostCalculateEvent with _$SuncostCalculateEvent {
  const factory SuncostCalculateEvent.started() = _Started;
  const factory SuncostCalculateEvent.calculate(
      String placePurpose, int monthlyBill, int powerLevel) = _Calculate;
}
