import 'dart:math';

class VendorBookingModel {
  final String vendorId;
  final int userId;
  final String address;
  final DateTime date;
  final String? notes;

  VendorBookingModel({
    required this.vendorId,
    required this.userId,
    required this.address,
    required this.date,
    this.notes,
  });

  // Generate random booking code
  static String generateCodeBooking() {
    const prefix = 'SMT';
    final random = Random();
    final numbers = List.generate(8, (_) => random.nextInt(10)).join();
    return '$prefix-$numbers';
  }

  // Factory method to create an instance from a Map (for database)
  factory VendorBookingModel.fromMap(Map<String, dynamic> map) {
    return VendorBookingModel(
      userId: map['user_id'] is String
          ? int.parse(map['user_id']) 
          : map['user_id'], 
      vendorId: map['vendor_id'] is int
          ? map['vendor_id'].toString()
          : map['vendor_id'],
      address: map['address'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }

  // Method to convert an instance to a Map (for database)
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId.toInt(),
      'vendor_id': vendorId,
      'address': address,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }
}
