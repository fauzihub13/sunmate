import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/presentation/suncost/models/calculate_model.dart';

class SuncostLocalDatasources {
  final homeElectricity = [
    {'power_level': 1300, 'price': 1444.70},
    {'power_level': 2200, 'price': 1444.70},
    {'power_level': 3500, 'price': 1699.53},
    {'power_level': 6600, 'price': 1699.53},
  ];

  final commercialElectricity = [
    {'power_level': 6600, 'price': 1444.70},
    {'power_level': 200000, 'price': 1444.70},
  ];

  final int effectiveSundial = 5;
  final double supportingComponent = 0.25;
  final int solarPanelPrice = 12000000;

  Future<Either<String, CalculateModel>> calculate(
      String placePurpose, int monthlyBill, int powerLevel) async {
    try {
      // Validasi `placePurpose`
      if (placePurpose != "rumah_tinggal" && placePurpose != "tempat_usaha") {
        return const Left(
            "Tujuan tempat tinggal harus 'rumah_tinggal' atau 'usaha'.");
      }

      // Pilih list berdasarkan tujuan tempat tinggal
      var electricityList = (placePurpose == "rumah_tinggal")
          ? homeElectricity
          : commercialElectricity;

      // Cari data berdasarkan powerLevel
      var matchingData = electricityList.firstWhere(
        (item) => item['power_level'] == powerLevel,
        orElse: () => electricityList.last,
      );

      num pricePerKwh = matchingData['price']!;
      double pricePerKwhDouble = pricePerKwh.toDouble();
      double solarPanelCapacity = pricePerKwhDouble / (5 * 30);
      int investmentCost = (solarPanelCapacity * solarPanelPrice).toInt();
      int totalCostEstimate =
          investmentCost + (investmentCost * supportingComponent.toInt());
      var result = CalculateModel(
        placePurpose: placePurpose,
        monthlyBill: monthlyBill,
        powerLevel: powerLevel,
        costEstimate: totalCostEstimate,
      );

      return Right(result);
    } catch (e) {
      return Left("Error: ${e.toString()}");
    }
  }
}
