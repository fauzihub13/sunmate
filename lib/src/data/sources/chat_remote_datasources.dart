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

    var myFile = http.MultipartFile.fromBytes(
      'image',
      bytes,
      filename: 'image.png',
    );

    request.files.add(myFile);

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        var decodedResponse = json.decode(responseBody);
        String? location = decodedResponse['location'];
        debugPrint('File uploaded to: $location');
        return '${Variables.baseUrl}/$location';
      } else {
        debugPrint('Error Body: $responseBody');
      }
    } catch (e) {
      debugPrint('Error sending request: $e');
    }

    return null;
  }
}
