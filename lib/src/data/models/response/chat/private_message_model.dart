import 'package:cloud_firestore/cloud_firestore.dart';

class PrivateMessageModel {
  final String id;
  final bool isImage;
  final String message;
  final Timestamp timestamp;
  final int userId;
  final String channelId;

  PrivateMessageModel({
    required this.id,
    required this.isImage,
    required this.message,
    required this.timestamp,
    required this.userId,
    required this.channelId,
  });

  /// Convert MessageModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isImage': isImage,
      'message': message,
      'timestamp': timestamp,
      'userId': userId,
      'channelId': channelId,
    };
  }

  /// Create MessageModel from Map (Firestore Document)
  factory PrivateMessageModel.fromMap(Map<String, dynamic> map) {
    return PrivateMessageModel(
      id: map['id'] ?? '',
      isImage: map['isImage'] ?? false,
      message: map['message'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      userId: map['userId'] ?? 0,
      channelId: map['channelId'] ?? 0,
    );
  }

  /// Create MessageModel from Firestore DocumentSnapshot
  factory PrivateMessageModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PrivateMessageModel.fromMap(data);
  }
}
