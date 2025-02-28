import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_history_model.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:http/http.dart' as http;

class BookingVendorRemoteDatasources {
  Future<Either<String, BookingDataResponse>> createBooking(
      VendorBookingModel vendorBookingModel) async {
    final authData = await AuthLocalDatasources().getAuthData();

    final url = Uri.parse('${Variables.apiUrl}/vendors/booking');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
      },
      body: {
        "user_id": vendorBookingModel.userId.toString(),
        "vendor_id": vendorBookingModel.vendorId,
        "address": vendorBookingModel.address,
        "date": vendorBookingModel.date.toIso8601String(),
        "notes": vendorBookingModel.notes
      },
    );

    if (response.statusCode == 200) {
      // Parse the response body
      final decodedResponse =
          VendorBookingResponseModel.fromJson(response.body);

      if (decodedResponse.data != null) {
        return Right(decodedResponse.data!);
      } else {
        return const Left('Response does not contain booking data.');
      }
    } else if (response.statusCode == 422) {
      final jsonResponse = jsonDecode(response.body);

      final errors = jsonResponse['errors'] as Map<String, dynamic>;
      final errorMessages =
          errors.entries.map((entry) => '${entry.value.join(", ")}').join("\n");
      return Left(errorMessages);
    } else if (response.statusCode == 401) {
      await AuthLocalDatasources().removeAuthData();
      return const Left('logged_out');
    } else {
      return const Left('Failed to booking vendor.');
    }
  }

  Future<Either<String, VendorBookingHistoryResponseModel>>
      getUserBookingHistory() async {
    final url = Uri.parse('${Variables.apiUrl}/vendors/booking/history/user');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(VendorBookingHistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else {
      return const Left('Failed to get booking history.');
    }
  }

  Future<Either<String, VendorBookingHistoryResponseModel>>
      getVendorBookingHistory() async {
    final url = Uri.parse('${Variables.apiUrl}/vendors/booking/history');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Right(VendorBookingHistoryResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return const Left('Vendor not found for this user.');
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else {
      return const Left('Failed to get booking history.');
    }
  }

  Future<Either<String, bool>> updateBookingHistoryStatus(
      String vendorId, String bookingStatus) async {
    final url = Uri.parse('${Variables.apiUrl}/vendors/booking/history/status');
    final authData = await AuthLocalDatasources().getAuthData();
    final response = await http.post(url, headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    }, body: {
      'vendor_id': vendorId,
      'status': bookingStatus
    });

    if (response.statusCode == 200) {
      return const Right(true);
    } else if (response.statusCode == 404) {
      return const Left('Vendor booking history not found.');
    } else if (response.statusCode == 401) {
      return const Left('logged_out');
    } else {
      return const Left('Failed to update booking history.');
    }
  }
}
