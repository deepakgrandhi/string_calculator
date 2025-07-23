import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('Step 8 - Support multiple custom delimiters', () {
    setUp(() => StringCalculator.strictMode = false);

    test('adds numbers separated by * and %', () {
      expect(StringCalculator.add('//[*][%]\n1*2%3'), 6);
    });

    test('adds numbers using longer delimiters like *** and %%', () {
      expect(StringCalculator.add('//[***][%%]\n1***2%%3'), 6);
    });

    test('throws error if delimiter format is wrong (strict mode)', () {
      StringCalculator.strictMode = true;
      expect(
        () => StringCalculator.add('//[***[%]\n1***2%3'),
        throwsFormatException,
      );
    });

    test('ignores badly formatted delimiter in liberal mode', () {
      expect(StringCalculator.add('//[***[%]\n1***2%3'), 3);
    });
  });
}
