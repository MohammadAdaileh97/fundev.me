import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class General {
  static bool isJson({required String data}) {
    try {
      final decoded = json.decode(data);
      return decoded is Map || decoded is List;
    } catch (e) {
      return false;
    }
  }

  static double? convertToDouble(var value) {
    if (value == null) return null;

    if (value is num) {
      return value.toDouble();
    }

    if (value is String) {
      final trimmedValue = value.trim();
      if (trimmedValue.isEmpty) return null;

      final normalizedValue = trimmedValue.replaceAll(',', '');
      final parsedValue = double.tryParse(normalizedValue);
      if (parsedValue != null) return parsedValue;

      final sanitizedValue = normalizedValue.replaceAll(
        RegExp(r'[^0-9.\-]'),
      );
      if (sanitizedValue.isEmpty || sanitizedValue == '-' || sanitizedValue == '.') {
        return null;
      }

      return double.tryParse(sanitizedValue);
    }

    return null;
  }

  static String formatDate(String date) {
    if (date.trim().isEmpty) return "-";

    final parsedDate = DateTime.tryParse(date);
    if (parsedDate == null) return "-";

    return DateFormat('yyyy-MM-dd', 'en_US').format(parsedDate);
  }

  static String formatTime(String time) {
    if (time.trim().isEmpty) return "-";

    final parsedTime = DateTime.tryParse(time);
    if (parsedTime == null) return "-";

    return DateFormat('hh:mm a', 'en_US').format(parsedTime);
  }

  static String formatDateTime(String dateTime) {
    if (dateTime.trim().isEmpty) return "-";

    final parsedDateTime = DateTime.tryParse(dateTime);
    if (parsedDateTime == null) return "-";

    return DateFormat(
      'yyyy-MM-dd hh:mm a',
      'en_US',
    ).format(parsedDateTime);
  }

  static String convertToThousand({required double? num}) {
    if (num == null) return "0.000"; // Handle null input

    // Truncate instead of rounding
    String truncatedValue =
        ((num * 1000).truncateToDouble() / 1000.0).toString();

    var parts = truncatedValue.split('.');
    var formatter = NumberFormat(
      "#,##0",
      "en_US",
    ); // Format only the integer part

    // Ensure three decimal places manually
    String decimalPart = parts.length > 1 ? parts[1].padRight(3, '0') : "000";

    return "${formatter.format(int.parse(parts[0]))}.$decimalPart";
  }

  static String convertToDecimal({required double? num}) {
    if (num == null) return "0.000"; // Handle null input

    // Truncate instead of rounding
    double truncatedValue = (num * 1000).truncateToDouble() / 1000;

    // Convert to string with exactly 3 decimal places
    return truncatedValue.toStringAsFixed(3);
  }

  static String? differentBetweenCurrentDateTimeAndGivenDateTime({
    required String dateTime,
  }) {
    try {
      final slaDate = DateTime.tryParse(dateTime);
      if (slaDate == null) return null;

      final currentDate = DateTime.now();
      final remainingTime = slaDate.difference(currentDate);
      int remainingHours = remainingTime.inHours;
      if (remainingHours < 0) {
        remainingHours = 0;
      }
      return remainingHours.toString();
    } catch (error) {
      return null;
    }
  }

  static String colorToHexRGB(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  static bool isTokenExpiringIn2MinutesOrLess({required String token}) {
    if (token.trim().isEmpty) return true;

    try {
      if (JwtDecoder.isExpired(token)) {
        return true;
      }

      final expirationDate = JwtDecoder.getExpirationDate(token);
      if (expirationDate == null) {
        return true;
      }

      final currentTime = DateTime.now();
      final timeLeft = expirationDate.difference(currentTime);

      return timeLeft.inMinutes <= 2 || timeLeft.inSeconds <= 120;
    } catch (_) {
      return true;
    }
  }
}
