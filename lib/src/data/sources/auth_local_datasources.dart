import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasources {
  Future<void> saveAuthData(AuthResponseModel authReponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authReponseModel.toJson());
  }

  Future<void> updateUserData(User updatedUserData) async {
    final prefs = await SharedPreferences.getInstance();
    final authDataJson = prefs.getString('auth_data');

    if (authDataJson != null) {
      final authResponse = AuthResponseModel.fromJson(authDataJson);

      final updatedAuthResponse = AuthResponseModel(
        status: authResponse.status,
        token: authResponse.token,
        user: updatedUserData, // update user data
      );
      await prefs.setString('auth_data', updatedAuthResponse.toJson());
    }
  }

  // Future<void> saveUserData(AuthResponseModel authReponseModel) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('user_data', authReponseModel.toJson());
  // }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  // Future<void> removeUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('user_data');
  // }

  Future<AuthResponseModel> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');

    return AuthResponseModel.fromJson(authData!);
  }

  Future<bool> isAuthDataExist() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }
}
