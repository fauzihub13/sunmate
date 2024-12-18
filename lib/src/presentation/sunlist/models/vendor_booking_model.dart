import 'dart:math';

class VendorBookingModel {



  final String codeBooking;
  final String idVendor;
  final String vendorName;
  final String vendorImage;
  final String userName;
  final String userEmail;
  final String userPhoneNumber;
  final String userAddress;
  final DateTime bookingDate;
  final String status;
  final String? notes;

  VendorBookingModel({
    required this.codeBooking,
    required this.idVendor,
    required this.vendorName,
    required this.vendorImage,
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.userAddress,
    required this.bookingDate,
    this.status = 'pending',
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
      codeBooking: map['code_booking'],
      idVendor: map['id_vendor'],
      vendorName: map['vendor_name'],
      vendorImage: map['vendor_image'],
      userName: map['user_name'],
      userEmail: map['user_email'],
      userPhoneNumber: map['user_phone_number'],
      userAddress: map['user_address'],
      bookingDate: DateTime.parse(map['booking_date']),
      status: map['status'] ?? 'pending',
      notes: map['notes'],
    );
  }

  // Method to convert an instance to a Map (for database)
  Map<String, dynamic> toMap() {
    return {
      'code_booking': codeBooking,
      'id_vendor': idVendor,
      'vendor_name': vendorName,
      'vendor_image': vendorImage,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone_number': userPhoneNumber,
      'user_address': userAddress,
      'booking_date': bookingDate.toIso8601String(),
      'status': status,
      'notes': notes,
    };
  }
}
