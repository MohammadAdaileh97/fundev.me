import 'package:flutter_test/flutter_test.dart';
import 'package:fun_dev_project/core/utl/general.dart';

void main() {
  group('General utility methods', () {
    test('convertToDouble parses supported numeric values', () {
      expect(General.convertToDouble(10), 10.0);
      expect(General.convertToDouble(10.5), 10.5);
      expect(General.convertToDouble('12.75'), 12.75);
      expect(General.convertToDouble('1,250.50'), 1250.5);
      expect(General.convertToDouble('  42  '), 42.0);
    });

    test('convertToDouble returns null for empty or invalid values', () {
      expect(General.convertToDouble(null), isNull);
      expect(General.convertToDouble(''), isNull);
      expect(General.convertToDouble('abc'), isNull);
    });

    test('format methods return a placeholder for invalid input', () {
      expect(General.formatDate(''), '-');
      expect(General.formatTime('invalid'), '-');
      expect(General.formatDateTime('not-a-date'), '-');
      expect(General.formatDate('2024-05-10'), '2024-05-10');
    });

    test('token expiry check fails safely for invalid tokens', () {
      expect(General.isTokenExpiringIn2MinutesOrLess(token: ''), isTrue);
      expect(General.isTokenExpiringIn2MinutesOrLess(token: 'invalid-token'), isTrue);
    });
  });
}
