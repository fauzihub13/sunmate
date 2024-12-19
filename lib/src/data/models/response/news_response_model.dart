import 'dart:convert';

class NewsResponseModel {
  final String? status;
  final String? message;
  final List<SingleNews>? data;

  NewsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory NewsResponseModel.fromJson(String str) =>
      NewsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsResponseModel.fromMap(Map<String, dynamic> json) =>
      NewsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SingleNews>.from(json["data"]!.map((x) => SingleNews.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class SingleNews {
  final String? id;
  final String? image;
  final String? slug;
  final String? title;
  final String? description;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SingleNews({
    this.id,
    this.image,
    this.slug,
    this.title,
    this.description,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory SingleNews.fromJson(String str) => SingleNews.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleNews.fromMap(Map<String, dynamic> json) => SingleNews(
        id: json["id"],
        image: json["image"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
        "slug": slug,
        "title": title,
        "description": description,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
