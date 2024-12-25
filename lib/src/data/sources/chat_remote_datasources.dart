import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

class ChatRemoteDatasources {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('chats');

  Future<void> sendMessage(String message,
      {bool isImage = false, required int userId}) async {
    try {
      // Push for get unique id
      String messageId = ref.push().key ?? "unknown";

      // Build json message
      final messageData = {
        'user_id': userId,
        'isImage': isImage,
        'message': message,
        'timestamp': (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      };

      // Save data with unique Id
      await ref.child(messageId).set(messageData);
    } catch (e) {
      debugPrint('Error mengirim pesan: $e');
    }
  }

  Future<String?> uploadImage(Uint8List bytes) async {
    final url = Uri.parse('${Variables.apiUrl}/chats/image');
    final authData = await AuthLocalDatasources().getAuthData();

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll({
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json',
    });

    // Menambahkan file ke request body
    var myFile = http.MultipartFile.fromBytes(
      'image',
      bytes,
      filename: 'image.png',
    );

    // Menambahkan file ke request
    request.files.add(myFile);

    try {
      // Menunggu respons dari server
      final response = await request.send();

      if (response.statusCode == 201) {
        // Menunggu stream response dan mengembalikan body-nya
        final responseBody = await response.stream.bytesToString();

        try {
          var decodedResponse = json.decode(responseBody);
          String? location = decodedResponse['location'];
          debugPrint('File uploaded to: $location');
          return '${Variables.baseUrl}/$location'; // Mengembalikan URL gambar
        } catch (e) {
          debugPrint('Error parsing response JSON: $e');
        }
      } else {
        // Jika status code bukan 201, tampilkan error
        final responseBody = await response.stream.bytesToString();
        debugPrint('Error Body: $responseBody');
      }
    } catch (e) {
      debugPrint('Error sending request: $e');
    }

    return null; // Kembalikan null jika gagal
  }
}
