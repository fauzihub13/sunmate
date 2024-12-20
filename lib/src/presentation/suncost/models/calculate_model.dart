class CalculateModel {
  final int powerLevel, monthlyBill;
  final int? costEstimate;
  final String placePurpose;

  CalculateModel({
    required this.placePurpose,
    required this.monthlyBill,
    required this.powerLevel,
    this.costEstimate,
  });
}
