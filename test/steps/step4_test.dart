import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 4 - Custom Delimiter Support (Hybrid Mode)', () {
    test('handles custom delimiter ";"', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('//;\n1;2;3'), 6);
    });

    test('handles custom delimiter "|"', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('//|\n4|5|6'), 15);
    });

    test('handles complex delimiter "***"', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('//***\n1***2***3'), 6);
    });

    test('handles custom + default delimiters mixed', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('//;\n1;2\n3,4'), 10);
    });

    test('throws on bad value with custom delimiter (strict)', () {
      StringCalculator.strictMode = true;
      expect(() => StringCalculator.add('//;\n1;abc;2'), throwsFormatException);
    });
  });
}
