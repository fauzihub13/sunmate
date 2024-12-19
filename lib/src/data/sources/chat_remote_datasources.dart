import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';

class ChatRemoteDatasources {
  // Membuat referensi database
  final DatabaseReference ref = FirebaseDatabase.instance.ref('chats');

  // Menyimpan pesan ke Firebase
  Future<void> sendMessage(String message,
      {bool isImage = false, required int userId}) async {
    final AuthLocalDatasources authLocalDatasources;
    try {
      // Menggunakan .push() untuk mendapatkan ID unik untuk setiap pesan
      String messageId = ref.push().key ?? "unknown";

      // Menyusun data pesan
      final messageData = {
        'user_id': userId,
        'isImage': isImage,
        'message': message,
        'timestamp': (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      };

      // Menyimpan data menggunakan child() dengan ID unik
      await ref.child(messageId).set(messageData);
    } catch (e) {
      debugPrint('Error mengirim pesan: $e');
    }
  }
}
