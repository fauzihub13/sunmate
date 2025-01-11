import 'dart:convert';

class NewsResponseModel {
  final String? status;
  final String? message;
  final List<SingleNews>? newsList;
  final SingleNews? singleNews;

  NewsResponseModel({
    this.status,
    this.message,
    this.newsList,
    this.singleNews,
  });

  // Factory method untuk deserialisasi dari JSON
  factory NewsResponseModel.fromJson(String str) =>
      NewsResponseModel.fromMap(json.decode(str));

  // Serialisasi ke JSON
  String toJson() => json.encode(toMap());

  // Factory method untuk deserialisasi dari Map
  factory NewsResponseModel.fromMap(Map<String, dynamic> json) {
    if (json["news"] is List) {
      return NewsResponseModel(
        status: json["status"],
        message: json["message"],
        newsList: json["news"] == null
            ? []
            : List<SingleNews>.from(
                json["news"].map((x) => SingleNews.fromMap(x))),
      );
    } else {
      return NewsResponseModel(
        status: json["status"],
        message: json["message"],
        singleNews:
            json["news"] == null ? null : SingleNews.fromMap(json["news"]),
      );
    }
  }

  // Serialisasi ke Map
  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "news": newsList != null
            ? List<dynamic>.from(newsList!.map((x) => x.toMap()))
            : singleNews?.toMap(),
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

  factory SingleNews.fromJson(String str) =>
      SingleNews.fromMap(json.decode(str));

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
