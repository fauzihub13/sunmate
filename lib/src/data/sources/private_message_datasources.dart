import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sunmate/src/data/models/response/private_message_model.dart';

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
}
