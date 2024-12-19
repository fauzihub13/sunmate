import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
}
