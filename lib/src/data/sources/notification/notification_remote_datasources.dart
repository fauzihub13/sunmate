import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/notification/notification_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

class NotificationRemoteDatasources {
  Future<Either<String, NotificationResponseModel>>
      getAllNotification() async {
    final url = Uri.parse('${Variables.apiUrl}/notifications');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(NotificationResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else {
      return const Left('Failed to get notification history.');
    }
  }
}