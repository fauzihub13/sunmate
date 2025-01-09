import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final bool isImage;
  final String message;
  final int timestamp;
  final int userId;

  MessageModel({
    required this.isImage,
    required this.message,
    required this.timestamp,
    required this.userId,
  });

  /// Convert MessageModel to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'isImage': isImage,
      'message': message,
      'timestamp': timestamp,
      'userId': userId,
    };
  }

  /// Create MessageModel from Map (Firestore Document)
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      isImage: map['isImage'] ?? false,
      message: map['message'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      userId: map['userId'] ?? 0,
    );
  }

  /// Create MessageModel from Firestore DocumentSnapshot
  factory MessageModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel.fromMap(data);
  }
}
