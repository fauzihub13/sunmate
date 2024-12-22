import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  final String message;
  final Color? backgroundColor; // Nullable parameter untuk warna
  const AlertMessage({
    super.key,
    required this.message,
    this.backgroundColor, // Default ke null
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ??
          const Color.fromARGB(160, 31, 65, 187), // Default biru jika null
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 80,
        left: 16,
        right: 16,
      ),
    );
  }
}

// Fungsi untuk menampilkan SnackBar
void showSunTalkSnackBar(BuildContext context, String message,
    {Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // Ubah AlertMessage menjadi SnackBar
      content: Text(message),
      backgroundColor: backgroundColor ??
          const Color.fromARGB(160, 31, 65, 187), // Default biru jika null
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        bottom: 80,
        left: 16,
        right: 16,
      ),
    ),
  );
}
