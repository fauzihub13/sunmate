import 'package:cloud_firestore/cloud_firestore.dart';

class ChannelMessageModel {
  final String id;
  final List<String>? memberIds;
  final String? lastMessage;
  final Timestamp? lastTime;
  final Map<String, bool>? unRead;
  final Map<String, bool>? isActive;
  final String? sendBy;

  ChannelMessageModel({
    required this.id,
    this.memberIds,
    this.lastMessage,
    this.lastTime,
    this.unRead,
    this.isActive,
    this.sendBy,
  });

  // Convert from Map (Firestore Document Snapshot) to ChannelMessageModel
  factory ChannelMessageModel.fromMap(String id, Map<String, dynamic> map) {
    return ChannelMessageModel(
      id: id,
      memberIds: List<String>.from(map['memberIds'] ?? []),
      lastMessage: map['lastMessage'] ?? '',
      lastTime: map['lastTime'] ?? Timestamp.now(),
      unRead: Map<String, bool>.from(map['unRead'] ?? {}),
      isActive: Map<String, bool>.from(map['isActive'] ?? {}),
      sendBy: map['sendBy'] ?? '',
    );
  }

  // Convert from ChannelMessageModel to Map (Firestore Document Format)
  Map<String, dynamic> toMap() {
    return {
      'memberIds': memberIds,
      'lastMessage': lastMessage,
      'lastTime': lastTime,
      'unRead': unRead,
      'isActive': isActive,
      'sendBy': sendBy,
    };
  }

  // Convert from Firestore DocumentSnapshot to ChannelMessageModel
  factory ChannelMessageModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChannelMessageModel(
      id: doc.id,
      memberIds: List<String>.from(data['memberIds'] ?? []),
      lastMessage: data['lastMessage'] ?? '',
      lastTime: data['lastTime'] ?? Timestamp.now(),
      unRead: Map<String, bool>.from(data['unRead'] ?? {}),
      isActive: Map<String, bool>.from(data['isActive'] ?? {}),
      sendBy: data['sendBy'] ?? '',
    );
  }
}
