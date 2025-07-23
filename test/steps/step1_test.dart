import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 1 - Core Functionality (Hybrid Mode)', () {
    test('returns 0 for empty string', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add(''), 0);
    });

    test('returns single number', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1'), 1);
    });

    test('returns sum of valid numbers', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1,2,3'), 6);
    });

    test('skips invalid inputs in liberal mode', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1,5m,,3,.'), 4);
    });

    test('throws on invalid inputs in strict mode', () {
      StringCalculator.strictMode = true;
      expect(() => StringCalculator.add('1,5m'), throwsFormatException);
    });

    test('ignores whitespace', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add(' 1 , 2 , 3 '), 6);
    });

    test('handles trailing commas in liberal mode', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1,2,'), 3);
    });
  });
}
