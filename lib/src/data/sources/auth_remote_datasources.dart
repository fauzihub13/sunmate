import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasources {
  final http.Client client;
  final AuthLocalDatasources authLocalDatasources;

  AuthRemoteDatasources(
      {http.Client? client, required this.authLocalDatasources})
      : client = client ?? http.Client();

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

  Future<Either<String, bool>> logout(String token) async {
    final url = Uri.parse('${Variables.apiUrl}/logout');
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      return const Right(true);
    } else {
      return const Left('Failed to logout');
    }
  }

  Future<Either<String, AuthResponseModel>> getUserData() async {
    final url = Uri.parse('${Variables.apiUrl}/user/data');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else {
      return const Left('Failed to get user data.');
    }
  }

  Future<Either<String, AuthResponseModel>> updateUserPassword(
      String oldPassword, String password, String passwordConfirmation) async {
    final url = Uri.parse('${Variables.apiUrl}/user/data/password');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    }, body: {
      'old_password': oldPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else if (response.statusCode == 422) {
      final jsonResponse = jsonDecode(response.body);
      final errors = jsonResponse['errors'] as Map<String, dynamic>;
      final errorMessages =
          errors.entries.map((entry) => '${entry.value.join(", ")}').join("\n");
      return Left(errorMessages);
    } else {
      return const Left('Failed to update user password.');
    }
  }

  Future<Either<String, AuthResponseModel>> updateUserData(
      String name, String phoneNumber, String email) async {
    final url = Uri.parse('${Variables.apiUrl}/user/data');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    }, body: {
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
    });

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else if (response.statusCode == 422) {
      final jsonResponse = jsonDecode(response.body);
      final errors = jsonResponse['errors'] as Map<String, dynamic>;
      final errorMessages =
          errors.entries.map((entry) => '${entry.value.join(", ")}').join("\n");
      return Left(errorMessages);
    } else {
      return const Left('Failed to update user data.');
    }
  }

  Future<Either<String, AuthResponseModel>> updateUserProfilePhoto(
      Uint8List bytes) async {
    final url = Uri.parse('${Variables.apiUrl}/user/data/image');
    final authData = await AuthLocalDatasources().getAuthData();

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll({
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    var myFile = http.MultipartFile.fromBytes(
      'image',
      bytes,
      filename: 'image.png',
    );

    request.files.add(myFile);

    final rawResponse = await request.send();
    var response = await http.Response.fromStream(rawResponse);

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else if (response.statusCode == 422) {
      final jsonResponse = jsonDecode(response.body);
      final errors = jsonResponse['errors'] as Map<String, dynamic>;
      final errorMessages =
          errors.entries.map((entry) => '${entry.value.join(", ")}').join("\n");
      return Left(errorMessages);
    } else {
      return Left('Failed to update user data. ${response.body}');
    }
  }
}
