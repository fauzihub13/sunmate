import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/private_message_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;

String channelId(String id1, String id2) {
  if (id1.hashCode < id2.hashCode) {
    return '$id1-$id2';
  } else {
    return '$id2-$id1';
  }
}

class PrivateMessageDatasources {
  PrivateMessageDatasources._init();

  static final PrivateMessageDatasources instance =
      PrivateMessageDatasources._init();

  Future<void> updateChannel(
      String channelId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('channels')
        .doc(channelId)
        .set(data, SetOptions(merge: true));
  }

  Future<void> addMessage(PrivateMessageModel messageModel) async {
    try {

      // Save data
      await FirebaseFirestore.instance.collection('messages').add(messageModel.toMap());
    } catch (e) {
      debugPrint('Error mengirim pesan: $e');
    }
  }

  Stream<List<PrivateMessageModel>> messageStream(String channelId) {
    return FirebaseFirestore.instance
        .collection('messages')
        .where('channelId', isEqualTo: channelId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((querySnapshot) {
      List<PrivateMessageModel> messageList = [];
      for (var element in querySnapshot.docs) {
        messageList.add(PrivateMessageModel.fromDocumentSnapshot(element));
      }
      return messageList;
    });
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
