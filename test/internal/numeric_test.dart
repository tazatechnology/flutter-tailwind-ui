// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_tailwind_ui/src/internal/numeric.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatNumber', () {
    test('should format zero correctly', () {
      expect(formatNumber(0), equals('0'));
      expect(formatNumber(0.0), equals('0'));
    });

    test('should format positive integers correctly', () {
      expect(formatNumber(1), equals('1'));
      expect(formatNumber(42), equals('42'));
      expect(formatNumber(1000), equals('1,000'));
      expect(formatNumber(12345), equals('12,345'));
    });

    test('should format negative integers correctly', () {
      expect(formatNumber(-1), equals('-1'));
      expect(formatNumber(-42), equals('-42'));
      expect(formatNumber(-1000), equals('-1,000'));
    });

    test('should format positive doubles with default precision', () {
      expect(formatNumber(3.14159), equals('3.14'));
      expect(formatNumber(2.71828), equals('2.72'));
      expect(formatNumber(1.23456789), equals('1.23'));
    });

    test('should format negative doubles with default precision', () {
      expect(formatNumber(-3.14159), equals('-3.14'));
      expect(formatNumber(-2.71828), equals('-2.72'));
    });

    test('should respect custom precision', () {
      expect(formatNumber(3.14159, precision: 0), equals('3'));
      expect(formatNumber(3.14159, precision: 1), equals('3.1'));
      expect(formatNumber(3.14159, precision: 3), equals('3.142'));
      expect(formatNumber(3.14159, precision: 5), equals('3.14159'));
    });

    test('should use scientific notation for very small numbers', () {
      expect(formatNumber(0.0001), equals('1.00e-4'));
      expect(formatNumber(0.00001), equals('1.00e-5'));
      expect(formatNumber(0.000001), equals('1.00e-6'));
    });

    test('should use scientific notation for very large numbers', () {
      expect(formatNumber(1000000), equals('1.00e6'));
      expect(formatNumber(10000000), equals('1.00e7'));
      expect(formatNumber(100000000), equals('1.00e8'));
    });

    test('should respect custom lower exponent threshold', () {
      expect(formatNumber(0.001, lowerExponentThreshold: 2), equals('1.00e-3'));
      expect(formatNumber(0.001, lowerExponentThreshold: 4), equals('0.001'));
      expect(
        formatNumber(0.0001, lowerExponentThreshold: 4),
        equals('1.00e-4'),
      );
    });

    test('should respect custom upper exponent threshold', () {
      expect(formatNumber(1000, upperExponentThreshold: 3), equals('1.00e3'));
      expect(formatNumber(1000, upperExponentThreshold: 4), equals('1,000'));
      expect(formatNumber(10000, upperExponentThreshold: 4), equals('1.00e4'));
    });

    test('should handle edge cases', () {
      expect(formatNumber(1.0), equals('1'));
      expect(formatNumber(-1.0), equals('-1'));
      expect(formatNumber(0.5), equals('0.50'));
      expect(formatNumber(-0.5), equals('-0.50'));
    });

    test('should handle very small precision values', () {
      expect(formatNumber(3.14159, precision: 0), equals('3'));
      expect(formatNumber(3.14159, precision: 1), equals('3.1'));
    });

    test('should handle very large precision values', () {
      expect(formatNumber(3.14159, precision: 10), equals('3.1415900000'));
      expect(formatNumber(2.71828, precision: 8), equals('2.71828000'));
    });

    test('should handle scientific notation with custom precision', () {
      expect(formatNumber(0.000123, precision: 1), equals('1.2e-4'));
      expect(formatNumber(1230000, precision: 1), equals('1.2e6'));
    });

    test('should handle boundary values for scientific notation', () {
      // Test at the threshold boundaries
      expect(
        formatNumber(0.0001, lowerExponentThreshold: 4),
        equals('1.00e-4'),
      );
      expect(formatNumber(0.001, lowerExponentThreshold: 4), equals('0.001'));
      expect(
        formatNumber(100000, upperExponentThreshold: 6),
        equals('100,000'),
      );
      expect(
        formatNumber(1000000, upperExponentThreshold: 6),
        equals('1.00e6'),
      );
    });

    test('should add thousands separators for values greater than 1000', () {
      expect(formatNumber(1000), equals('1,000'));
      expect(formatNumber(1234), equals('1,234'));
      expect(formatNumber(12345), equals('12,345'));
      expect(formatNumber(123456), equals('123,456'));
      expect(formatNumber(999999), equals('999,999'));
    });

    test(
      'should add thousands separators for negative values greater than 1000',
      () {
        expect(formatNumber(-1000), equals('-1,000'));
        expect(formatNumber(-1234), equals('-1,234'));
        expect(formatNumber(-12345), equals('-12,345'));
        expect(formatNumber(-123456), equals('-123,456'));
        expect(formatNumber(-999999), equals('-999,999'));
      },
    );

    test(
      'should add thousands separators for decimal values greater than 1000',
      () {
        expect(formatNumber(1000.5), equals('1,000.50'));
        expect(formatNumber(1234.56), equals('1,234.56'));
        expect(formatNumber(12345.678), equals('12,345.68'));
        expect(formatNumber(123456.789), equals('123,456.79'));
        expect(formatNumber(999999.123), equals('999,999.12'));
      },
    );
  });
}
