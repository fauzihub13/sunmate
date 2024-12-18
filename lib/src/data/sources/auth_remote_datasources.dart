import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasources {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.apiUrl}/login');
    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to login');
    }
  }

  Future<Either<String, bool>> register(String name, String phoneNumber,
      String email, String password, String passwordConfirmation) async {
    final url = Uri.parse('${Variables.apiUrl}/register');
    final response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    if (response.statusCode == 200) {
      return const Right(true);
    } else if (response.statusCode == 422) {
      final jsonResponse = jsonDecode(response.body);
      final errors = jsonResponse['errors'] as Map<String, dynamic>;
      final errorMessages =
          errors.entries.map((entry) => '${entry.value.join(", ")}').join("\n");
      return Left(errorMessages);
    } else {
      return const Left('Failed to register');
    }
  }

  Future<Either<String, bool>> logout() async {
    final authData = await AuthLocalDatasources().getAuthData();

    final url = Uri.parse('${Variables.apiUrl}/logout');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return const Left('Failed to login');
    }
  }
}
