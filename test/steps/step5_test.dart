import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 5 - Negative Numbers', () {
    test('throws for one negative number', () {
      expect(
        () => StringCalculator.add('1,-2,3'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('throws with message containing all negative numbers', () {
      try {
        StringCalculator.add('-1,2,-3,-5,6');
      } catch (e) {
        expect(e, isA<ArgumentError>());
        expect(
          (e as ArgumentError).message,
          contains('negatives not allowed: -1, -3, -5'),
        );
      }
    });

    test('still throws even in liberal mode', () {
      StringCalculator.strictMode = false;
      expect(
        () => StringCalculator.add('2,-9,4'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('throws with custom delimiter', () {
      expect(
        () => StringCalculator.add('//;\n-1;2;3'),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('throws with newline and commas mixed', () {
      expect(
        () => StringCalculator.add('1\n-2,3,-4'),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
