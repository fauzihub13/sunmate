import 'package:flutter_sunmate/src/presentation/sunlist/models/vendor_booking_model.dart';
import 'package:sqflite/sqflite.dart';

class BookingVendorLocalDatasources {
  BookingVendorLocalDatasources._init();

  static final BookingVendorLocalDatasources instance =
      BookingVendorLocalDatasources._init();

  final String tableVendorBookings = 'vendor_bookings';

  static Database? _database;

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableVendorBookings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code_booking VARCHAR(20) NOT NULL,
    id_vendor INTEGER NOT NULL,
    vendor_name TEXT NOT NULL,
    vendor_image TEXT NOT NULL,
    user_name TEXT NOT NULL,
    user_email TEXT NOT NULL,
    user_phone_number VARCHAR(15) NOT NULL,
    user_address TEXT NOT NULL,
    booking_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
    ''');
  }

  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filepath;

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('db_sunmate.db');
    return _database!;
  }

  // Save vendor booking to local database
  Future<void> createBooking(VendorBookingModel vendorBooking) async {
    final db = await instance.database;
    await db.insert(tableVendorBookings, vendorBooking.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  
}
