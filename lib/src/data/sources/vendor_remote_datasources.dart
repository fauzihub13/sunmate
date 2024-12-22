import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

class VendorRemoteDatasources {
  Future<Either<String, VendorResponseModel>> getVendors() async {
    final url = Uri.parse('${Variables.apiUrl}/vendors');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      return Right(VendorResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      // await AuthLocalDatasources().removeAuthData();
      return const Left('logged_out');
    } else {
      return const Left('Failed to get vendors');
    }
  }
}
