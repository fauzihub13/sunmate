import 'dart:convert';

class VendorBookingResponseModel {
  final String? status;
  final String? message;
  final BookingDataResponse? data;

  VendorBookingResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory VendorBookingResponseModel.fromJson(String str) =>
      VendorBookingResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendorBookingResponseModel.fromMap(Map<String, dynamic> json) =>
      VendorBookingResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : BookingDataResponse.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class BookingDataResponse {
  final String? code;
  final int? userId;
  final String? userName;
  final String? vendorId;
  final String? vendorName;
  final String? vendorImage;
  final String? address;
  final DateTime? date;
  final String? status;
  final String? notes;
  final String? id;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  BookingDataResponse({
    this.code,
    this.userId,
    this.userName,
    this.vendorId,
    this.vendorName,
    this.vendorImage,
    this.address,
    this.date,
    this.status,
    this.notes,
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  factory BookingDataResponse.fromJson(String str) =>
      BookingDataResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingDataResponse.fromMap(Map<String, dynamic> json) =>
      BookingDataResponse(
        code: json["code"],
        userId: json["user_id"] is int
            ? json["user_id"]
            : int.parse(json["user_id"]),
        userName: json["user_name"],
        vendorId: json["vendor_id"],
        vendorName: json["vendor_name"],
        vendorImage: json["vendor_image"],
        address: json["address"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        notes: json["notes"],
        id: json["id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "user_id": userId,
        "user_name": userName,
        "vendor_id": vendorId,
        "vendor_name": vendorName,
        "vendor_image": vendorImage,
        "address": address,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "status": status,
        "notes": notes,
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
      };
}
