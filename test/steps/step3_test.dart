import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 3 - Support newline delimiters (Hybrid Mode)', () {
    test('handles newlines along with commas', () {
      StringCalculator.strictMode = true;
      expect(StringCalculator.add('1\n2,3'), 6);
    });

    test('handles only newlines', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1\n2\n3\n4'), 10);
    });

    test('handles newlines and commas with spaces', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add(' 1 ,\n 2 , 3 '), 6);
    });

    test('skips invalid input with newline present (liberal)', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1\nabc\n3,.'), 4);
    });

    test('throws on invalid input with newline present (strict)', () {
      StringCalculator.strictMode = true;
      expect(() => StringCalculator.add('1\nabc\n3,'), throwsFormatException);
    });
  });
}
