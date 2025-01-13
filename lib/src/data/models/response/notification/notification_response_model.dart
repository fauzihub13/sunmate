import 'dart:convert';

class NotificationResponseModel {
  final String? status;
  final String? message;
  final List<Notification>? notifications;

  NotificationResponseModel({
    this.status,
    this.message,
    this.notifications,
  });

  factory NotificationResponseModel.fromJson(String str) =>
      NotificationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationResponseModel.fromMap(Map<String, dynamic> json) =>
      NotificationResponseModel(
        status: json["status"],
        message: json["message"],
        notifications: json["notifications"] == null
            ? []
            : List<Notification>.from(
                json["notifications"]!.map((x) => Notification.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "notifications": notifications == null
            ? []
            : List<dynamic>.from(notifications!.map((x) => x.toMap())),
      };
}

class Notification {
  final String? id;
  final String? userId;
  final String? title;
  final String? body;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Notification({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromJson(String str) =>
      Notification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        body: json["body"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "body": body,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
