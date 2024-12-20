import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/weather_response_model.dart';

class WeatherRemoteDatasources {
  Future<Either<String, WeatherResponseModel>> getWeather(String lat, String lon) async {
    // https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=9998c1cb6153f87724148a15da2aead6
    final url = Uri.parse('${Variables.apiOpenWeatherMap}lat=$lat&lon=$lon&appid=${Variables.apiKeyOpenWeatherMap}');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      return Right(WeatherResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get vendors');
    }
  }
}