import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String numericString = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericString.isEmpty) return newValue;

    int value = int.parse(numericString);
    String formattedValue = NumberFormat.decimalPattern('en_US').format(value);
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}