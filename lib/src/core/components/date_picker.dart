import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerHandler {
  static Future<void> showDatePickerDialog(
    BuildContext context,
    TextEditingController dateInput,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      dateInput.text = formattedDate;
    } else {}
  }
}
