import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 2 - Any Amount of Numbers (Hybrid Mode)', () {
    test('sums 10+ numbers correctly', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1,2,3,4,5,6,7,8,9,10'), 55);
    });

    test('sums 100 numbers correctly', () {
      StringCalculator.strictMode = false;
      final input = List.generate(100, (i) => '${i + 1}').join(',');
      expect(StringCalculator.add(input), 5050);
    });

    test('skips a few bad values but still sums correctly', () {
      StringCalculator.strictMode = false;
      expect(StringCalculator.add('1,2,3,abc,4,.,5'), 15);
    });

    test('throws if one bad value appears (strict mode)', () {
      StringCalculator.strictMode = true;
      expect(() => StringCalculator.add('1,2,.,s,,3,abc,4'), throwsFormatException);
    });
  });
}
