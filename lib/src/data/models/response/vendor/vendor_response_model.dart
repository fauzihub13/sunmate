import 'dart:convert';

import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';

class VendorResponseModel {
  final String? status;
  final String? message;
  final List<SingleVendor>? vendorList;
  final SingleVendor? singleVendor;

  VendorResponseModel({
    this.status,
    this.message,
    this.vendorList,
    this.singleVendor,
  });

  factory VendorResponseModel.fromJson(String str) =>
      VendorResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendorResponseModel.fromMap(Map<String, dynamic> json) {
    if (json["vendors"] is List) {
      return VendorResponseModel(
        status: json["status"],
        message: json["message"],
        vendorList: json["vendors"] == null
            ? []
            : List<SingleVendor>.from(
                json["vendors"]!.map((x) => SingleVendor.fromMap(x))),
      );
    } else {
      return VendorResponseModel(
        status: json["status"],
        message: json["message"],
        singleVendor: json["vendors"] == null
            ? null
            : SingleVendor.fromMap(json["vendors"]),
      );
    }
  }

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "vendors": vendorList != null
            ? List<dynamic>.from(vendorList!.map((x) => x.toMap()))
            : singleVendor?.toMap(),
      };
}

class SingleVendor {
  final String? id;
  final String? userId;
  final String? slug;
  final String? name;
  final String? description;
  final double? rating;
  final String? address;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? latitude;
  final double? longitude;
  final String? product;
  final String? service;
  final List<VendorImage>? vendorImages;
  final User? user;

  SingleVendor({
    this.id,
    this.userId,
    this.slug,
    this.name,
    this.description,
    this.rating,
    this.address,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.product,
    this.service,
    this.vendorImages,
    this.user,
  });

  factory SingleVendor.fromJson(String str) =>
      SingleVendor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleVendor.fromMap(Map<String, dynamic> json) => SingleVendor(
        id: json["id"],
        userId: json["user_id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        address: json["address"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        latitude:
            json["latitude"] != null ? double.tryParse(json["latitude"]) : null,
        longitude: json["longitude"] != null
            ? double.tryParse(json["longitude"])
            : null,
        product: json["product"],
        service: json["service"],
        vendorImages: json["vendor_images"] == null
            ? []
            : List<VendorImage>.from(
                json["vendor_images"]!.map((x) => VendorImage.fromMap(x))),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "slug": slug,
        "name": name,
        "description": description,
        "rating": rating,
        "address": address,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "product": product,
        "service": service,
        "vendor_images": vendorImages == null
            ? []
            : List<dynamic>.from(vendorImages!.map((x) => x.toMap())),
        "user": user?.toMap(),
      };
}

class VendorImage {
  final String? id;
  final String? vendorId;
  final String? path;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VendorImage({
    this.id,
    this.vendorId,
    this.path,
    this.createdAt,
    this.updatedAt,
  });

  factory VendorImage.fromJson(String str) =>
      VendorImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendorImage.fromMap(Map<String, dynamic> json) => VendorImage(
        id: json["id"],
        vendorId: json["vendor_id"],
        path: json["path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "vendor_id": vendorId,
        "path": path,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
