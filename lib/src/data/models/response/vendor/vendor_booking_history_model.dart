import 'dart:convert';

class VendorBookingHistoryResponseModel {
  final String? status;
  final String? message;
  final List<BookingHistoryDataResponse>? data;

  VendorBookingHistoryResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory VendorBookingHistoryResponseModel.fromJson(String str) =>
      VendorBookingHistoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VendorBookingHistoryResponseModel.fromMap(
          Map<String, dynamic> json) =>
      VendorBookingHistoryResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BookingHistoryDataResponse>.from(json["data"]!.map((x) => BookingHistoryDataResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BookingHistoryDataResponse {
  final String? id;
  final String? code;
  final String? userId;
  final String? userName;
  final String? vendorId;
  final String? vendorName;
  final String? vendorImage;
  final String? address;
  final DateTime? date;
  final String? notes;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BookingHistoryDataResponse({
    this.id,
    this.code,
    this.userId,
    this.userName,
    this.vendorId,
    this.vendorName,
    this.vendorImage,
    this.address,
    this.date,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingHistoryDataResponse.fromJson(String str) => BookingHistoryDataResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingHistoryDataResponse.fromMap(Map<String, dynamic> json) => BookingHistoryDataResponse(
        id: json["id"],
        code: json["code"],
        userId: json["user_id"],
        userName: json["user_name"],
        vendorId: json["vendor_id"],
        vendorName: json["vendor_name"],
        vendorImage: json["vendor_image"],
        address: json["address"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        notes: json["notes"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "user_id": userId,
        "user_name": userName,
        "vendor_id": vendorId,
        "vendor_name": vendorName,
        "vendor_image": vendorImage,
        "address": address,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "notes": notes,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
