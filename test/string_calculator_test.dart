import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator - Final Flow', () {
    test('returns 0 for empty string', () {
      expect(StringCalculator.add(''), 0);
    });
  });
}
