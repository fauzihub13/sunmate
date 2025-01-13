import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'profile',
    ],
  );

  Future<Either<String, AuthResponseModel>> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return const Left('Failed to sign in by Google, no user');
      }

      final googleAuth = await googleUser.authentication;

      if (googleAuth.idToken == null) {
        return const Left(
            'Failed to retrieve ID token. Scopes might be missing.');
      }

      final url = Uri.parse('${Variables.apiUrl}/auth/google');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'id_token': googleAuth.idToken}),
      );

      if (response.statusCode == 200) {
        return Right(AuthResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Failed to sign in by Google. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      return Left('An error occurred during Google Sign-In: $e');
    }
  }
}
